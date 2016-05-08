var expect = require('chai').expect
var r4s = require('../lib/index.js')

it('index method should return api response with utctime and version', function (done) {
  this.timeout(5000)
  r4s.index().then(function (data) {
    expect(data).to.have.property('utctime')
    expect(data).to.have.property('version')
    done()
  }, function (error) {
    assert.fail(error)
    done()
  })
})
