expect = require('chai').expect
Rage4Service = require('../src/')
r4s = new Rage4Service('TESTKEY')
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

updaterecord = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/updaterecord/')
  .query(true)
  .reply 200

updaterecord2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/updaterecord2/')
  .query(true)
  .reply 200

deleterecord = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/deleterecord/')
  .query(true)
  .reply 200

deleterecord2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/deleterecord2/')
  .query(true)
  .reply 200

recordfailover = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/recordfailover/')
  .query(true)
  .reply 200

recordfailover2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/recordfailover2/')
  .query(true)
  .reply 200

togglerecord = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/togglerecord/')
  .query(true)
  .reply 200

togglerecord2 = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/togglerecord2/')
  .query(true)
  .reply 200

getwebhooks = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getwebhooks/')
  .query(true)
  .reply 200

getwebhook = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/getwebhook/')
  .query(true)
  .reply 200

createwebhook = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/createwebhook/')
  .query(true)
  .reply 200

deletewebhook = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/deletewebhook/')
  .query(true)
  .reply 200

attachwebhook = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/attachwebhook/')
  .query(true)
  .reply 200

detachwebhook = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/detachwebhook/')
  .query(true)
  .reply 200

listrecordtypes = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/listrecordtypes/')
  .query(true)
  .reply 200

listgeoregions = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/listgeoregions/')
  .query(true)
  .reply 200

showcurrentusage = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/showcurrentusage/')
  .query(true)
  .reply 200

showcurrentglobalusage = nock('https://secure.rage4.com/RAPI')
  .persist()
  .get('/showcurrentglobalusage/')
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

it 'updaterecord w/o selfresponse method should trigger matching api call', ->
  r4s.updaterecord([], false).then () ->
    expect(updaterecord.isDone()).to.be.true

it 'updaterecord w/ selfresponse method should trigger matching api call', ->
  r4s.updaterecord([], true).then () ->
    expect(updaterecord2.isDone()).to.be.true

it 'deleterecord w/o selfresponse method should trigger matching api call', ->
  r4s.deleterecord([], false).then () ->
    expect(deleterecord.isDone()).to.be.true

it 'deleterecord w/ selfresponse method should trigger matching api call', ->
  r4s.deleterecord([], true).then () ->
    expect(deleterecord2.isDone()).to.be.true

it 'recordfailover w/o selfresponse method should trigger matching api call', ->
  r4s.recordfailover([], false).then () ->
    expect(recordfailover.isDone()).to.be.true

it 'recordfailover w/ selfresponse method should trigger matching api call', ->
  r4s.recordfailover([], true).then () ->
    expect(recordfailover2.isDone()).to.be.true

it 'togglerecord w/o selfresponse method should trigger matching api call', ->
  r4s.togglerecord([], false).then () ->
    expect(togglerecord.isDone()).to.be.true

it 'togglerecord w/ selfresponse method should trigger matching api call', ->
  r4s.togglerecord([], true).then () ->
    expect(togglerecord2.isDone()).to.be.true

it 'getwebhooks method should trigger matching api call', ->
  r4s.getwebhooks().then () ->
    expect(getwebhooks.isDone()).to.be.true

it 'getwebhook method should trigger matching api call', ->
  r4s.getwebhook().then () ->
    expect(getwebhook.isDone()).to.be.true

it 'createwebhook method should trigger matching api call', ->
  r4s.createwebhook().then () ->
    expect(createwebhook.isDone()).to.be.true

it 'deletewebhook method should trigger matching api call', ->
  r4s.deletewebhook().then () ->
    expect(deletewebhook.isDone()).to.be.true

it 'attachwebhook method should trigger matching api call', ->
  r4s.attachwebhook().then () ->
    expect(attachwebhook.isDone()).to.be.true

it 'detachwebhook method should trigger matching api call', ->
  r4s.detachwebhook().then () ->
    expect(detachwebhook.isDone()).to.be.true

it 'listrecordtypes method should trigger matching api call', ->
  r4s.listrecordtypes().then () ->
    expect(listrecordtypes.isDone()).to.be.true

it 'listgeoregions method should trigger matching api call', ->
  r4s.listgeoregions().then () ->
    expect(listgeoregions.isDone()).to.be.true

it 'showcurrentusage method should trigger matching api call', ->
  r4s.showcurrentusage().then () ->
    expect(showcurrentusage.isDone()).to.be.true

it 'showcurrentglobalusage method should trigger matching api call', ->
  r4s.showcurrentglobalusage().then () ->
    expect(showcurrentglobalusage.isDone()).to.be.true
