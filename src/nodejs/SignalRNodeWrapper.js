// Generated by CoffeeScript 1.8.0
(function() {
  var SignalR, SignalRNodeWrapper,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  SignalR = require('signalr-client');

  module.exports = SignalRNodeWrapper = (function() {
    SignalRNodeWrapper.prototype.observer_callbacks = {};

    SignalRNodeWrapper.prototype.observer_registry = function(entity) {
      var callback, _i, _j, _len, _len1, _ref, _ref1, _results, _results1;
      if (this.observer_callbacks[entity._id]) {
        _ref = this.observer_callbacks[entity._id];
        _results = [];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          callback = _ref[_i];
          _results.push(callback(entity));
        }
        return _results;
      } else if (this.observer_callbacks[entity.Type]) {
        _ref1 = this.observer_callbacks[entity.Type];
        _results1 = [];
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          callback = _ref1[_j];
          _results1.push(callback(entity));
        }
        return _results1;
      }
    };

    function SignalRNodeWrapper(url, hubNames, jquery) {
      if (jquery == null) {
        jquery = null;
      }
      this.observer_registry = __bind(this.observer_registry, this);
      this.url = url;
      this.hubs = {};
      this.available_hubs = hubNames;
    }

    SignalRNodeWrapper.prototype.getHub = function(which, callback, retries) {
      var retry, _this;
      if (retries == null) {
        retries = 10;
      }
      if (this.signalr == null) {
        this.signalr = new SignalR.client(this.url, this.available_hubs, null);
      }
      if (this.hubs[which] != null) {
        return callback(null, this.hubs[which]);
      }
      if (this.hubs[which] = this.signalr.hub(which)) {
        this.hubs[which].on('error', function(data) {
          return log(data);
        });
        this.hubs[which].on('UpdateEntity', this.observer_registry);
        return callback(null, this.hubs[which]);
      } else if (retries-- > 0) {
        _this = this;
        retry = function() {
          return _this.getHub(which, callback, retries);
        };
        return setTimeout(retry, 1000);
      } else {
        return callback("Timed out.", null);
      }
    };

    SignalRNodeWrapper.prototype.setCallback = function(id, futureCallback) {
      if (this.observer_callbacks[id] == null) {
        this.observer_callbacks[id] = [];
      }
      this.observer_callbacks[id].push(futureCallback);
    };

    SignalRNodeWrapper.prototype.removeCallback = function(id, pastCallback) {
      var callback, temp, _i, _len, _ref;
      if (pastCallback === null) {
        this.observer_callbacks[id] = [];
      } else {
        temp = [];
        _ref = this.observer_callbacks[id];
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          callback = _ref[_i];
          if (callback !== pastCallback) {
            temp.push(callback);
          }
        }
        this.observer_callbacks[id] = temp;
      }
    };

    SignalRNodeWrapper.prototype.subscribe = function(hubName, method, observerId, subject, futureCallback, callback) {
      this.setCallback(subject, futureCallback);
      return this.getHub(hubName, function(error, hub) {
        if (error != null) {
          return callback(error, null);
        } else {
          if (hub != null) {
            hub.invoke(method, observerId);
          }
          return callback(null, hub);
        }
      });
    };

    SignalRNodeWrapper.prototype.unsubscribe = function(hubName, method, observerId, subject, pastCallback, callback) {
      this.removeCallback(subject, pastCallback);
      if (this.observer_callbacks[subject].length === 0) {
        return this.getHub(hubName, function(error, hub) {
          if (error != null) {
            return callback(error, null);
          } else {
            if (hub != null) {
              hub.invoke(method, observerId);
            }
            return callback(null, hub);
          }
        });
      } else {
        return callback(null, true);
      }
    };

    return SignalRNodeWrapper;

  })();

}).call(this);

//# sourceMappingURL=SignalRNodeWrapper.js.map
