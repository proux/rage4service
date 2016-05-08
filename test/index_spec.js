var expect = require('chai').expect
var r4s = require('../lib/index.js')
var nock = require('nock')

it('index method should return api response with utctime and version', function () {
  this.timeout(5000)

  nock('https://secure.rage4.com/RAPI/')
    .persist()
    .get(/index/)
    .query(true)
    .reply(200, {
      utctime: 'now',
      version: 'tester'
    })

  r4s.index().then(function (data) {
    expect(data).to.have.property('utctime')
    expect(data).to.have.property('version')
  })
})

it('getdomains method should return array', function () {
  this.timeout(5000)

  nock('https://secure.rage4.com/RAPI/')
    .persist()
    .get(/getdomains/)
    .query(true)
    .reply(200, [])

  r4s.getdomains().then(function (data) {
    console.log(data)
    expect(data).to.be.a('array')
  })
})
