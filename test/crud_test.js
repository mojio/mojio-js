// Generated by CoffeeScript 1.10.0
(function() {
  var MojioClient, assert, config, mojio_client, should, testdata;

  MojioClient = require('../lib/nodejs/MojioClient');

  config = require('./config/mojio-config.coffee');

  mojio_client = new MojioClient(config);

  assert = require("assert");

  testdata = require('./data/mojio-test-data');

  should = require('should');

  describe('Get_CRUD', function() {
    return it('can get resource', function(done) {
      return mojio_client.login(testdata.username, testdata.password, function(error, result) {
        (error === null).should.be["true"];
        return mojio_client.request({
          resource: 'Apps',
          method: 'GET',
          parameters: {}
        }, function(error, result) {
          (error != null).should.be["false"];
          result.should.be.an.instanceOf(Object);
          return done();
        });
      });
    });
  });

}).call(this);

//# sourceMappingURL=crud_test.js.map
