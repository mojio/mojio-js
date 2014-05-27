MojioModel = require('./MojioModel')
module.exports = class Trip extends MojioModel
    constructor: (json) ->
        @schema =
            {
                "Type": "Integer",
                "MojioId": "String",
                "VehicleId": "String",
                "StartTime": "String",
                "LastUpdatedTime": "String",
                "EndTime": "String",
                "MaxSpeed": "Float",
                "MaxAcceleration": "Float",
                "MaxDeceleration": "Float",
                "MaxRPM": "Integer",
                "FuelLevel": "Float",
                "FuelEfficiency": "Float",
                "Distance": "Float",
                "MovingTime": "Float",
                "IdleTime": "Float",
                "StopTime": "Float",
                "StartLocation": "Object",
                "LastKnownLocation": "Object",
                "EndLocation": "Object",
                "StartAddress": "Object",
                "EndAddress": "Object",
                "ForcefullyEnded": "Boolean",
                "StartMilage": "Float",
                "EndMilage": "Float",
                "_id": "String",
                "_deleted": "Boolean"
            }

        super(json)