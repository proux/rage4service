expect = require('chai').expect
r4s = require('../src/')
nock = require('nock')

index = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/index/')
  .query(true)
  .reply 200

getdomains = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getdomains/')
  .query(true)
  .reply 200

getdomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getdomain/')
  .query(true)
  .reply 200

getdomainbyname = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getdomainbyname/')
  .query(true)
  .reply 200

createregulardomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createregulardomain/')
  .query(true)
  .reply 200

createreversedomain4 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createreversedomain4/')
  .query(true)
  .reply 200

createreversedomain6 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createreversedomain6/')
  .query(true)
  .reply 200

deletedomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/deletedomain/')
  .query(true)
  .reply 200

updatedomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/updatedomain/')
  .query(true)
  .reply 200

updatedomain2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/updatedomain2/')
  .query(true)
  .reply 200

importdomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/importdomain/')
  .query(true)
  .reply 200

importdomainext = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/importdomainext/')
  .query(true)
  .reply 200

syncdomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/syncdomain/')
  .query(true)
  .reply 200

syncslavedomain = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/syncslavedomain/')
  .query(true)
  .reply 200

exportzonefile = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/exportzonefile/')
  .query(true)
  .reply 200

getdnssecinfo = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getdnssecinfo/')
  .query(true)
  .reply 200

enablednssec = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/enablednssec/')
  .query(true)
  .reply 200

disablednssec = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/disablednssec/')
  .query(true)
  .reply 200

getrecords = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getrecords/')
  .query(true)
  .reply 200

getrecord = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getrecord/')
  .query(true)
  .reply 200

createrecord = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createrecord/')
  .query(true)
  .reply 200

createrecord2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createrecord2/')
  .query(true)
  .reply 200


it 'index method should trigger matching api call', ->
  r4s.index().then () ->
    expect(index.isDone()).to.be.true

it 'getdomains method should trigger matching api call', ->
  r4s.getdomains().then () ->
    expect(getdomains.isDone()).to.be.true

it 'getdomain method should trigger matching api call', ->
  r4s.getdomain().then () ->
    expect(getdomain.isDone()).to.be.true

it 'getdomainbyname method should trigger matching api call', ->
  r4s.getdomainbyname().then () ->
    expect(getdomainbyname.isDone()).to.be.true

it 'createregulardomain method should trigger matching api call', ->
  r4s.createregulardomain().then () ->
    expect(createregulardomain.isDone()).to.be.true

it 'createreversedomain4 method should trigger matching api call', ->
  r4s.createreversedomain4().then () ->
    expect(createreversedomain4.isDone()).to.be.true

it 'createreversedomain6 method should trigger matching api call', ->
  r4s.createreversedomain6().then () ->
    expect(createreversedomain6.isDone()).to.be.true

it 'deletedomain method should trigger matching api call', ->
  r4s.deletedomain().then () ->
    expect(deletedomain.isDone()).to.be.true

it 'updatedomain method w/o selfresponse should trigger matching api call', ->
  r4s.updatedomain([], false).then () ->
    expect(updatedomain.isDone()).to.be.true

it 'updatedomain method w/ selfresponse should trigger matching api call', ->
  r4s.updatedomain([], true).then () ->
    expect(updatedomain2.isDone()).to.be.true

it 'importdomain method should trigger matching api call', ->
  r4s.importdomain().then () ->
    expect(importdomain.isDone()).to.be.true

it 'importdomainext method should trigger matching api call', ->
  r4s.importdomainext().then () ->
    expect(importdomainext.isDone()).to.be.true

it 'syncdomain method should trigger matching api call', ->
  r4s.syncdomain().then () ->
    expect(syncdomain.isDone()).to.be.true

it 'syncslavedomain method should trigger matching api call', ->
  r4s.syncslavedomain().then () ->
    expect(syncslavedomain.isDone()).to.be.true

it 'exportzonefile method should trigger matching api call', ->
  r4s.exportzonefile().then () ->
    expect(exportzonefile.isDone()).to.be.true

it 'getdnssecinfo method should trigger matching api call', ->
  r4s.getdnssecinfo().then () ->
    expect(getdnssecinfo.isDone()).to.be.true

it 'enablednssec method should trigger matching api call', ->
  r4s.enablednssec().then () ->
    expect(enablednssec.isDone()).to.be.true

it 'disablednssec method should trigger matching api call', ->
  r4s.disablednssec().then () ->
    expect(disablednssec.isDone()).to.be.true

it 'getrecords method should trigger matching api call', ->
  r4s.getrecords().then () ->
    expect(getrecords.isDone()).to.be.true

it 'getrecord method should trigger matching api call', ->
  r4s.getrecord().then () ->
    expect(getrecord.isDone()).to.be.true

it 'createrecord w/o selfresponse method should trigger matching api call', ->
  r4s.createrecord([], false).then () ->
    expect(createrecord.isDone()).to.be.true

it 'createrecord w/ selfresponse method should trigger matching api call', ->
  r4s.createrecord([], true).then () ->
    expect(createrecord2.isDone()).to.be.true
