{
    "App": {
        "Type": "String",
        "Name": "String",
        "Description": "String",
        "CreationDate": "String",
        "Downloads": "Integer",
        "RedirectUris": "String",
        "ApplicationType": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Login": {
        "Type": "String",
        "AppId": "String",
        "UserId": "String",
        "ValidUntil": "String",
        "Scopes": "String",
        "Sandboxed": "Boolean",
        "Depricated": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Mojio": {
        "Type": "Integer",
        "OwnerId": "String",
        "Name": "String",
        "Imei": "String",
        "LastContactTime": "String",
        "VehicleId": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Trip": {
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
        "StartLocation": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "LastKnownLocation": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "EndLocation": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "StartAddress": { "Address1": "String", "Address2": "String", "City": "String", "State": "String", "Zip": "String", "Country": "String"},
        "EndAddress": { "Address1": "String", "Address2": "String", "City": "String", "State": "String", "Zip": "String", "Country": "String"},
        "ForcefullyEnded": "Boolean",
        "StartMilage": "Float",
        "EndMilage": "Float",
        "StartOdometer": "Float",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "User": {
        "Type": "Integer",
        "UserName": "String",
        "FirstName": "String",
        "LastName": "String",
        "Email": "String",
        "UserCount": "Integer",
        "Credits": "Integer",
        "CreationDate": "String",
        "LastActivityDate": "String",
        "LastLoginDate": "String",
        "Locale": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Vehicle": {
        "Type": "Integer",
        "OwnerId": "String",
        "MojioId": "String",
        "Name": "String",
        "VIN": "String",
        "LicensePlate": "String",
        "IgnitionOn": "Boolean",
        "VehicleTime": "String",
        "LastTripEvent": "String",
        "LastLocationTime": "String",
        "LastLocation": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "LastSpeed": "Float",
        "FuelLevel": "Float",
        "LastAcceleration": "Float",
        "LastAccelerometer": "Object",
        "LastAltitude": "Float",
        "LastBatteryVoltage": "Float",
        "LastDistance": "Float",
        "LastHeading": "Float",
        "LastVirtualOdometer": "Float",
        "LastOdometer": "Float",
        "LastRpm": "Float",
        "LastFuelEfficiency": "Float",
        "CurrentTrip": "String",
        "LastTrip": "String",
        "LastContactTime": "String",
        "MilStatus": "Boolean",
        "DiagnosticCodes": "Object",
        "FaultsDetected": "Boolean",
        "LastLocationTimes": "Array",
        "LastLocations": "Array",
        "LastSpeeds": "Array",
        "LastHeadings": "Array",
        "LastAltitudes": "Array",
        "Viewers": "Array",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Address": {
        "Address1": "String",
        "Address2": "String",
        "City": "String",
        "State": "String",
        "Zip": "String",
        "Country": "String"
    },
    "Location": {
        "Lat": "Float",
        "Lng": "Float",
        "FromLockedGPS": "Boolean",
        "Dilution": "Float",
        "IsValid": "Boolean"
    },
    "Invoice": {
        "Type": "String",
        "BuyerId": "String",
        "AppId": "String",
        "Date": "String",
        "DueDate": "String",
        "DueOnShip": "Boolean",
        "Items": "Array",
        "PromoCode": "String",
        "Currency": "String",
        "SubTotal": "Float",
        "Tax": "Float",
        "Shipping": "Float",
        "Total": "Float",
        "Address": { "Address1": "String", "Address2": "String", "City": "String", "State": "String", "Zip": "String", "Country": "String"},
        "Owing": "Float",
        "OwingReason": "String",
        "Shipped": "Boolean",
        "Paid": "Boolean",
        "StripeId": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Product": {
        "Type": "String",
        "AppId": "String",
        "Name": "String",
        "Description": "String",
        "Shipping": "Boolean",
        "Taxable": "Boolean",
        "Price": "Float",
        "Discontinued": "Boolean",
        "OwnerId": "String",
        "CreationDate": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Observer": {
        "Type": "String",
        "Name": "String",
        "ObserverType": "String",
        "EventTypes" : "Array",
        "AppId": "String",
        "OwnerId": "String",
        "Parent": "String",
        "ParentId": "String",
        "Subject": "String",
        "SubjectId": "String",
        "Transports": "Integer",
        "Status": "Integer",
        "Tokens": "Array",
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "ObserverToken": {
        "Transport": "Integer"
    },
    "Subscription": {
        "Type": "String",
        "ChannelType": "Integer",
        "ChannelTarget": "String",
        "AppId": "String",
        "OwnerId": "String",
        "Event": "Integer",
        "EntityType": "Integer",
        "EntityId": "String",
        "Interval": "Integer",
        "LastMessage": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Event": {
        "Type": "Integer",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean",
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" }
    },
    "AccelerationEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Float",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "Integer",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "AccelerometerEvent": {
        "Type": "Integer",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "BatteryEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Float",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "Integer",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "ConnectionLost": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "DecelerationEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "DiagnosticEvent": {
        "DTCs": "Array",
        "MilStatus": "Boolean",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "FenceEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "FuelEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "HardEvent": {
        "Force": "Float",
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "HeadingChangeEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "IgnitionEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "MileageEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "ParkEvent": {
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "PowerEvent": {
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "SpeedEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "MaxSpeed": "Float",
        "AverageSpeed": "Float",
        "MovingTime" : "Float",
        "IdleTime" : "Float",
        "StopTime" : "Float",
        "MaxRPM" : "Float",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "TowEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Integer",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "String",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "TripEvent": {
        "TripId": "String",
        "Altitude": "Float",
        "Heading": "Float",
        "Distance": "Float",
        "FuelLevel": "Float",
        "FuelEfficiency": "Float",
        "Speed": "Float",
        "Acceleration": "Float",
        "Deceleration": "Float",
        "Odometer": "Float",
        "RPM": "Integer",
        "Type": "Integer",
        "MojioId": "String",
        "VehicleId": "String",
        "OwnerId": "String",
        "EventType": "Integer",
        "Time": "String",
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Accelerometer": { "X": "Float", "Y": "Float", "Z": "Float" },
        "TimeIsApprox": "Boolean",
        "BatteryVoltage": "Float",
        "ConnectionLost": "Boolean",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "Subscription": {
        "Type": "Integer",
        "ChannelType": "Integer",
        "ChannelTarget": "String",
        "AppId": "String",
        "OwnerId": "String",
        "Event": "Integer",
        "EntityType": "Integer",
        "EntityId": "String",
        "Interval": "Integer",
        "LastMessage": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "AccelerationObserver": {
        "AccelerationLow": "Float",
        "AccelerationHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "AccelerometerObserver": {
        "AccelerometerLow": { "X": "Float", "Y": "Float", "Z": "Float" },
        "AccelerometerHigh": { "X": "Float", "Y": "Float", "Z": "Float" },
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
    },
    "AltitudeObserver": {
        "AltitudeLow": "Float",
        "AltitudeHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "BatteryVoltageObserver": {
        "BatteryVoltageLow": "Float",
        "BatteryVoltageHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "ConditionalObserver": {
        "Field": "String",
        "Threshold1": "Float",
        "Threshold2": "Float",
        "Operator1": "String",
        "Operator2": "String",
        "Conjunction": "String",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "SmoothVehicleObserver":{
        "InterpolationRate": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "SmoothMojioObserver": {
        "InterpolationRate": "Float",
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
    },
    "SmoothTripObserver": {
        "InterpolationRate": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "DiagnosticCodeObserver": {
        "DiagnosticCodes": "Array",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "DistanceObserver": {
        "DistanceLow": "Float",
        "DistanceHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "EventObserver": {
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "FuelLevelObserver": {
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "GeoFenceObserver": {
        "Location": { "Lat": "Float", "Lng": "Float", "FromLockedGPS": "Boolean", "Dilution": "Float"},
        "Radius": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "HeadingObserver": {
        "HeadingLow": "Float",
        "HeadingHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "OdometerObserver": {
        "OdometerLow": "Float",
        "OdometerHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "RPMObserver": {
        "RpmLow": "Float",
        "RpmHigh": "Float",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "ScriptObserver": {
        "Script": "String",
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    },
    "SpeedObserver": {
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
        "TimeWindow": "String",
        "BroadcastOnlyRecent": "Boolean",
        "Throttle": "String",
        "NextAllowedBroadcast": "String",
        "_id": "String",
        "_deleted": "Boolean"
    }

}