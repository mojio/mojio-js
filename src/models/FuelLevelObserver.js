// Generated by CoffeeScript 1.9.3
(function() {
  var FuelLevelObserver, MojioModel,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  MojioModel = require('./MojioModel');

  module.exports = FuelLevelObserver = (function(superClass) {
    extend(FuelLevelObserver, superClass);

    FuelLevelObserver.prototype._schema = {
      "FuelLow": "Float",
      "FuelHigh": "Float",
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

    FuelLevelObserver.prototype._resource = 'FuelLevelObservers';

    FuelLevelObserver.prototype._model = 'FuelLevelObserver';

    function FuelLevelObserver(json) {
      FuelLevelObserver.__super__.constructor.call(this, json);
    }

    FuelLevelObserver._resource = 'FuelLevelObservers';

    FuelLevelObserver._model = 'FuelLevelObserver';

    FuelLevelObserver.resource = function() {
      return FuelLevelObserver._resource;
    };

    FuelLevelObserver.model = function() {
      return FuelLevelObserver._model;
    };

    return FuelLevelObserver;

  })(MojioModel);

}).call(this);

//# sourceMappingURL=FuelLevelObserver.js.map
