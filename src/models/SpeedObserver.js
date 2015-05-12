// Generated by CoffeeScript 1.8.0
(function() {
  var MojioModel, SpeedObserver,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  MojioModel = require('./MojioModel');

  module.exports = SpeedObserver = (function(_super) {
    __extends(SpeedObserver, _super);

    SpeedObserver.prototype._schema = {
      "SpeedLow": "Float",
      "SpeedHigh": "Float",
      "Timing": "Integer",
      "Type": "Integer",
      "Name": "String",
      "ObserverType": "Integer",
      "AppId": "String",
      "OwnerId": "String",
      "Parent": "String",
      "ParentId": "String",
      "Subject": "String",
      "SubjectId": "String",
      "Transports": "Integer",
      "Status": "Integer",
      "Tokens": "Array",
      "_id": "String",
      "_deleted": "Boolean"
    };

    SpeedObserver.prototype._resource = 'SpeedObservers';

    SpeedObserver.prototype._model = 'SpeedObserver';

    function SpeedObserver(json) {
      SpeedObserver.__super__.constructor.call(this, json);
    }

    SpeedObserver._resource = 'SpeedObservers';

    SpeedObserver._model = 'SpeedObserver';

    SpeedObserver.resource = function() {
      return SpeedObserver._resource;
    };

    SpeedObserver.model = function() {
      return SpeedObserver._model;
    };

    return SpeedObserver;

  })(MojioModel);

}).call(this);

//# sourceMappingURL=SpeedObserver.js.map
