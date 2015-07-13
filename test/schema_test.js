// Generated by CoffeeScript 1.9.3
(function() {
  var MojioClient, assert, config, mojio_client, should, testdata;

  MojioClient = require('../lib/nodejs/MojioClient');

  config = require('./config/mojio-config.coffee');

  mojio_client = new MojioClient(config);

  assert = require("assert");

  testdata = require('./data/mojio-test-data');

  should = require('should');

  describe('Get_Schema', function() {
    return it('can get resource', function(done) {
      return mojio_client.schema(function(error, result) {
        (error === null).should.be["true"];
        mojio_client.should.be.an.instanceOf(MojioClient);
        return done();
      });
    });
  });

}).call(this);

//# sourceMappingURL=schema_test.js.map
