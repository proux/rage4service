expect = require('chai').expect
r4s = require('../src/')
nock = require('nock')

it 'index method should return api response with utctime and version', ->
  @timeout 5000

  nock('https://secure.rage4.com/RAPI/').persist().get(/index/)
  .query(true)
  .reply 200,
    utctime: 'now'
    version: 'tester'

  r4s.index().then (data) ->
    expect(data).to.have.property 'utctime'
    expect(data).to.have.property 'version'

  return

it 'getdomains method should return array', ->
  @timeout 5000

  nock('https://secure.rage4.com/RAPI/').persist().get(/getdomains/)
  .query(true).reply 200, []

  r4s.getdomains().then (data) ->
    expect(data).to.be.a 'array'

  return
