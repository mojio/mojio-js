MojioModel = require('./MojioModel')

module.exports = class AccelerometerObserver extends MojioModel
    # instance variables
    _schema:             {
                "AccelerometerLow": {
                    "X": "Float",
                    "Y": "Float",
                    "Z": "Float"
                },
                "AccelerometerHigh": {
                    "X": "Float",
                    "Y": "Float",
                    "Z": "Float"
                },
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
                "TimeWindow": "String",
                "BroadcastOnlyRecent": "Boolean",
                "Throttle": "String",
                "NextAllowedBroadcast": "String",
                "Tokens": "Array",
                "_id": "String",
                "_deleted": "Boolean"
            }

    _resource: 'AccelerometerObservers'
    _model: 'AccelerometerObserver'

    constructor: (json) ->
        super(json)

    # class variables and functions
    @_resource: 'AccelerometerObservers'
    @_model: 'AccelerometerObserver'

    @resource: () ->
        return AccelerometerObserver._resource

    @model: () ->
        return AccelerometerObserver._model

