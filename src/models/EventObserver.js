// Generated by CoffeeScript 1.9.3
(function() {
  var EventObserver, MojioModel,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  MojioModel = require('./MojioModel');

  module.exports = EventObserver = (function(superClass) {
    extend(EventObserver, superClass);

    EventObserver.prototype._schema = {
      "EventTypes": "Array",
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

    EventObserver.prototype._resource = 'EventObservers';

    EventObserver.prototype._model = 'EventObserver';

    function EventObserver(json) {
      EventObserver.__super__.constructor.call(this, json);
    }

    EventObserver._resource = 'EventObservers';

    EventObserver._model = 'EventObserver';

    EventObserver.resource = function() {
      return EventObserver._resource;
    };

    EventObserver.model = function() {
      return EventObserver._model;
    };

    return EventObserver;

  })(MojioModel);

}).call(this);

//# sourceMappingURL=EventObserver.js.map
