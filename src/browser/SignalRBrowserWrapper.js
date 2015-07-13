// Generated by CoffeeScript 1.9.3
(function() {
  var SignalRBrowserWrapper,
    bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  module.exports = SignalRBrowserWrapper = (function() {
    SignalRBrowserWrapper.prototype.observer_callbacks = {};

    SignalRBrowserWrapper.prototype.observer_registry = function(entity) {
      var callback, i, j, len, len1, ref, ref1, results, results1;
      if (this.observer_callbacks[entity._id]) {
        ref = this.observer_callbacks[entity._id];
        results = [];
        for (i = 0, len = ref.length; i < len; i++) {
          callback = ref[i];
          results.push(callback(entity));
        }
        return results;
      } else if (this.observer_callbacks[entity.Type]) {
        ref1 = this.observer_callbacks[entity.Type];
        results1 = [];
        for (j = 0, len1 = ref1.length; j < len1; j++) {
          callback = ref1[j];
          results1.push(callback(entity));
        }
        return results1;
      }
    };

    function SignalRBrowserWrapper(url, hubNames, jquery) {
      this.observer_registry = bind(this.observer_registry, this);
      this.$ = jquery;
      this.url = url;
      this.hubs = {};
      this.signalr = null;
      this.connectionStatus = false;
    }

    SignalRBrowserWrapper.prototype.getHub = function(which, callback) {
      if (this.hubs[which]) {
        return callback(null, this.hubs[which]);
      } else {
        if (this.signalr == null) {
          this.signalr = this.$.hubConnection(this.url, {
            useDefaultPath: false
          });
          this.signalr.error(function(error) {
            console.log("Connection error" + error);
            return callback(error, null);
          });
        }
        this.hubs[which] = this.signalr.createHubProxy(which);
        this.hubs[which].on("error", function(data) {
          return console.log("Hub '" + which + "' has error" + data);
        });
        this.hubs[which].on("UpdateEntity", this.observer_registry);
        if (this.hubs[which].connection.state !== 1) {
          if (!this.connectionStatus) {
            return this.signalr.start().done((function(_this) {
              return function() {
                _this.connectionStatus = true;
                return _this.hubs[which].connection.start().done(function() {
                  return callback(null, _this.hubs[which]);
                });
              };
            })(this));
          } else {
            return this.hubs[which].connection.start().done((function(_this) {
              return function() {
                return callback(null, _this.hubs[which]);
              };
            })(this));
          }
        } else {
          return callback(null, this.hubs[which]);
        }
      }
    };

    SignalRBrowserWrapper.prototype.setCallback = function(id, futureCallback) {
      if (this.observer_callbacks[id] == null) {
        this.observer_callbacks[id] = [];
      }
      this.observer_callbacks[id].push(futureCallback);
    };

    SignalRBrowserWrapper.prototype.removeCallback = function(id, pastCallback) {
      var callback, i, len, ref, temp;
      if (pastCallback === null) {
        this.observer_callbacks[id] = [];
      } else {
        temp = [];
        ref = this.observer_callbacks[id];
        for (i = 0, len = ref.length; i < len; i++) {
          callback = ref[i];
          if (callback !== pastCallback) {
            temp.push(callback);
          }
        }
        this.observer_callbacks[id] = temp;
      }
    };

    SignalRBrowserWrapper.prototype.subscribe = function(hubName, method, observerId, subject, futureCallback, callback) {
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

    SignalRBrowserWrapper.prototype.unsubscribe = function(hubName, method, observerId, subject, pastCallback, callback) {
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

    return SignalRBrowserWrapper;

  })();

}).call(this);
