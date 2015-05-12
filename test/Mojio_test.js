// Generated by CoffeeScript 1.8.0
(function() {
  var Mojio, MojioClient, assert, config, mojio_client, should, testObject, testdata;

  MojioClient = require('../lib/nodejs/MojioClient');

  Mojio = require('../lib/models/Mojio');

  config = require('./config/mojio-config.coffee');

  mojio_client = new MojioClient(config);

  assert = require('assert');

  testdata = require('./data/mojio-test-data');

  should = require('should');

  testObject = null;

  describe('Mojio', function() {
    before(function(done) {
      return mojio_client.login(testdata.username, testdata.password, function(error, result) {
        (error === null).should.be["true"];
        return done();
      });
    });
    it('can get Mojios from Model', function(done) {
      var mojio;
      mojio = new Mojio({});
      mojio.authorization(mojio_client);
      return mojio.get({}, function(error, result) {
        var instance, _i, _len, _ref;
        (error === null).should.be["true"];
        mojio_client.should.be.an.instanceOf(MojioClient);
        result.Objects.should.be.an.instanceOf(Array);
        if ((result.Objects != null) && result.Objects instanceof Array) {
          _ref = result.Objects;
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            instance = _ref[_i];
            instance.should.be.an.instanceOf(Mojio);
          }
          testObject = instance;
        } else {
          result.should.be.an.instanceOf(Mojio);
          testObject = result;
        }
        return done();
      });
    });
    it('can get Mojios', function(done) {
      return mojio_client.get(Mojio, {}, function(error, result) {
        var instance, _i, _len, _ref;
        (error === null).should.be["true"];
        mojio_client.should.be.an.instanceOf(MojioClient);
        result.Objects.should.be.an.instanceOf(Array);
        _ref = result.Objects;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          instance = _ref[_i];
          instance.should.be.an.instanceOf(Mojio);
        }
        return done();
      });
    });
    it('can create, find, save, and delete Mojio', function(done) {
      var mojio;
      mojio = new Mojio().mock();
      return mojio_client.post(mojio, function(error, result) {
        (error === null).should.be["true"];
        mojio = new Mojio(result);
        return mojio_client.get(Mojio, mojio.id(), function(error, result) {
          (error === null).should.be["true"];
          mojio_client.should.be.an.instanceOf(MojioClient);
          result.should.be.an.instanceOf(Mojio);
          return mojio_client.put(result, function(error, result) {
            (error === null).should.be["true"];
            result.should.be.an.instanceOf(Object);
            mojio = new Mojio(result);
            return mojio_client["delete"](mojio, function(error, result) {
              (error === null).should.be["true"];
              (result.result === "ok").should.be["true"];
              return done();
            });
          });
        });
      });
    });
    return it('can create, save, and delete Mojio from model', function(done) {
      var mojio;
      mojio = new Mojio().mock();
      mojio.authorization(mojio_client);
      mojio._id = null;
      return mojio.post(function(error, result) {
        (error === null).should.be["true"];
        result.should.be.an.instanceOf(Object);
        mojio = new Mojio(result);
        mojio.authorization(mojio_client);
        return mojio.get(mojio.id(), function(error, result) {
          result.should.be.an.instanceOf(Mojio);
          mojio = new Mojio(result);
          mojio.authorization(mojio_client);
          return mojio.put(function(error, result) {
            (error === null).should.be["true"];
            result.should.be.an.instanceOf(Object);
            mojio = new Mojio(result);
            mojio.authorization(mojio_client);
            return mojio["delete"](function(error, result) {
              (error === null).should.be["true"];
              (result.result === "ok").should.be["true"];
              return done();
            });
          });
        });
      });
    });
  });

}).call(this);

//# sourceMappingURL=Mojio_test.js.map
