// Generated by CoffeeScript 1.9.3
(function() {
  var FormUrlencoded, Http, MojioGroupingSDK, MojioRestSDK, SignalR, _,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  Http = require('./HttpNodeWrapper');

  SignalR = require('./SignalRNodeWrapper');

  FormUrlencoded = require('form-urlencoded');

  _ = require('underscore');

  MojioRestSDK = require('./MojioRestSDK');

  module.exports = MojioGroupingSDK = (function(superClass) {
    extend(MojioGroupingSDK, superClass);

    function MojioGroupingSDK(options) {
      if (options == null) {
        options = {};
      }
      MojioGroupingSDK.__super__.constructor.call(this, options);
    }

    MojioGroupingSDK.prototype.group = function(name, callback) {
      if ((callback != null)) {
        this.callback(callback);
      }
      return this;
    };

    MojioGroupingSDK.prototype.add = function(name, callback) {
      if ((callback != null)) {
        this.callback(callback);
      }
      return this;
    };

    MojioGroupingSDK.prototype.remove = function(name, callback) {
      if ((callback != null)) {
        this.callback(callback);
      }
      return this;
    };

    MojioGroupingSDK.prototype.into = function(callback) {
      if ((callback != null)) {
        this.callback(callback);
      }
      return this;
    };

    MojioGroupingSDK.prototype.outof = function(callback) {
      if ((callback != null)) {
        this.callback(callback);
      }
      return this;
    };

    return MojioGroupingSDK;

  })(MojioRestSDK);

}).call(this);

//# sourceMappingURL=MojioGroupingSDK.js.map
