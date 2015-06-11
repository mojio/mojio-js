# mojio-js

Mojio javascript REST client.  Mojio provides a standard REST platform for writing connected car applications.

This repository contains a Node-js client and a Browser based js client.

(NOTE: the signature for observe and unobserve have changed from version 2.0.1 to 2.1.0)

For browser based HTML applications you get this client via Bower: (you will also need jquery)

```.sh-session
bower install mojio-js
bower install jquery
```

Or via the Mojio CDN at https://djaqzxyxnyyiy.cloudfront.net

```.html
<script src="https://djaqzxyxnyyiy.cloudfront.net/mojio-js.js"></script>
```
Note that on the CDN, you can link to specific versions of the application if you want to avoid any updates:
```.html
<script src="https://djaqzxyxnyyiy.cloudfront.net/3.5.0/mojio-js.js"></script>
```


If you are in a node environment, use npm:

```.sh-session
npm install mojio-js
```

You can always checkout this repo and use the code directly.
All distributions for the browser are in the "dist" directory.
All distributions for Node-js are in the "lib" directory.

The browser client needs jquery to work properly.  See the example and test directories for how to use this client.

Look here in the repository:
```
example/login.html
test/login_test.coffee
```
[![build status](https://travis-ci.org/mojio/mojio-js.svg?branch=master)](https://travis-ci.org/mojio/mojio-js)

## HTML Example

### CoffeeScript:

authorize.html
```.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>

<div id="result"></div>
<br/>

<script src="../bower_components/jquery/dist/jquery.js"></script>
<script src="../bower_components/signalr/jquery.signalR-2.0.2.js"></script>
<script src="../dist/browser/MojioClient.js"></script>
<script src="authorize.js"></script>

</body>
```
authorize.coffee (compiles to authorize.js included in the html above)
```.coffee
Mojio = @Mojio

config = {
    application: 'Your-Application-Key-Here', # Fill in your application key here
    hostname: 'api.moj.io',
    version: 'v1',
    port:'443',
    scheme: 'https',
    redirect_uri: 'Your-Login-redirect_url-Here', # Fill in your redirect url here (Ex. 'http://localhost:63342/mojio-js/example/authorize_complete.html')
	live: false # Set to true if using the live environment 

}

mojio_client = new MojioClient(config)

$( () ->
	if (config.application == 'Your-Application-Key-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set your application key in authorize.js.  <br>'
        return
	if (config.application == 'Your-Logout-redirect_url-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set the login redirect url in authorize.js and register it in your application at the developer center.  <br>'
        return
        
    mojio_client.authorize(config.redirect_uri)
)
```
On completion of the oauth login, the browser will be redirected to the given redirect_url on the host server or application.  The example's implementation which contains how to retrieve the logged in user and the authorization token is below: 

authorize_complete.html
```.html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>title</title>
</head>
<body>

<div id="result"></div>
<br/>
<div id="result2"></div>
<br/>
<div id="result3"></div>
<br/>

<script src="../bower_components/jquery/dist/jquery.js"></script>
<script src="../bower_components/signalr/jquery.signalR-2.0.2.js"></script>
<script src="../dist/browser/MojioClient.js"></script>
<script src="authorize_complete.js"></script>

</body>
```
authorize_complete.coffee (compiles to authorize_complete.js included in the html above)
```.js
MojioClient = @MojioClient

config = {
    application: 'Your-Application-Key-Here', # Fill in your application key here
    hostname: 'api.moj.io',
    version: 'v1',
    port:'443',
    scheme: 'https',
    redirect_uri: 'Your-Logout-redirect_url-Here', # Fill in your redirect url here (Ex. 'http://localhost:63342/mojio-js/example/authorize.html')
	live: false # Set to true if using the live environment 
}

mojio_client = new MojioClient(config)
App = mojio_client.model('App')

$( () ->
	if (config.application == 'Your-Application-Key-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set your application key in authorize_complete.js.  <br>'
        return
	if (config.redirect_uri == 'Your-Logout-redirect_url-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set the logout redirect url in authorize_complete.js and register it in your application at the developer center.  <br>'
        return

    mojio_client.token((error, result) ->
        if (error)
            alert("Authorize Redirect, token could not be retrieved:"+error)
        else
            alert("Authorization Successful.")

            div = document.getElementById('result')
            div.innerHTML += 'POST /login<br>'
            div.innerHTML += JSON.stringify(result)
            mojio_client.query(App, {}, (error, result) ->
                if (error)
                    div = document.getElementById('result2')
                    div.innerHTML += 'Get Apps Error'+error+'<br>'
                else
                    apps = mojio_client.getResults(App, result)

                    app = apps[0]
                    div = document.getElementById('result2')
                    div.innerHTML += 'Query /App<br>'
                    div.innerHTML += JSON.stringify(result)
                    alert("Hit Ok to log out and return to the authorization page.")
                    mojio_client.unauthorize(config.redirect_uri)
            )
    )
)
```

## Node JS Example

Any OAuth2 implementation for node js should probably work.  TODO: write example using https://www.npmjs.org/package/simple-oauth2

### CoffeeScript:
The old login is deprecated and will be removed in a few months:
```.js
config = {
           application: 'YOUR APPLICATION KEY',
           secret: 'YOUR SECRET KEY',
           hostname: 'api.moj.io'
         }
Mojio = require './lib/MojioClient.js'
mojio = new Mojio(config)

mojio.login('YOUR USERNAME', 'YOUR PASSWORD', (error, result) ->
    if error then console.log("error: "+error) else console.log("success:"+result)
)
```
### JavaScript
```.js
var Mojio, mojio, config;

config = {
  application: 'YOUR APPLICATION KEY',
  secret: 'YOUR SECRET KEY',
  hostname: 'api.moj.io',
  version: 'v1',
  port: '443',
  scheme: 'https'
};

Mojio = require('./lib/MojioClient.js');

mojio = new Mojio(config);

mojio.login('YOUR USERNAME', 'YOUR PASSWORD', function(error, result) {
  if (error) {
    return console.log("error: " + error);
  } else {
    return console.log("success:" + result);
  }
});
```

### Query/Get

Queries can be accomplished by supplying an object with these properties: criteria, limit, offset, sortby, desc.
Normally criteria is supplied to the API as a semicolon separated list of field/value pairs, but in the Javascript
SDK you can supply an object and it will convert it for you to the proper format.  This is encouraged because
the API will be migrating to OData style queries eventually and the SDK will adapt when this happens.

Examples:
No criteria-
```.js
query(model, { limit=10, offset=0, sortby="name", desc=false }, callback)
 ```
object based criteria-
```.js
query(model, { criteria={ name="blah", field="blah" }, limit=10, offset=0, sortby="name", desc=false }, callback)
```
string based field/value list criteria-
```.js
query(model, { criteria="name=blah; field=blah;", limit=10, offset=0, sortby="name", desc=false }, callback)
```

When the data comes back from a get call, or from an observer (see below), it is returned in two formats within two fields.
The first field is called "Data" and is a list of Objects directly parsed from the JSON.  
The second field is called "Objects" and is a list of Mojio Models newed up from the parsed JSON.  
The Objects array models is what the SDK uses in the observers and other calls that have as parameters retrieved objects.

### Observers

You can observe changes to entities in the Mojio system and have the system push those changes to your application through SignalR or through REST Post callbacks.  For client side applications, SignalR is the preferred technology, where as a sever based application would probably prefer POST callbacks.

There are two main methods available in the javascript client, "watch" and "observe".  For "watch", construct the observer based on one of the observer schema types.  

Optionally, for Vehicles and Events, conditional observers can be created that deliver changes to you only if a particular measurement has satisfied a condition.  For instance, "Speed" is a measurement available on events and stored as "LastSpeed" on vehicles.  A conditional "Speed" observer with a SpeedLow value of 80 will fire if the speed is greator than 80 (as you have guessed already, SpeedHigh can be set to restrict the upper bound too.

See src/models/schema.coffee or try out the Mojio API endpoint https://api.moj.io/schema or more specifically: https://api.moj.io/v1/Schema?entityType=observers)

The objects that can be observed are enumerated here: https://api.moj.io/v1/Schema?entityType=cannon and here: https://api.moj.io/v1/Schema?entityType=events

See the test folder, test/observers_Test.coffee and test/conditional_observer_test.coffee for examples of the "observe" and "watch" methods respectively. Conditional observers can only be created with the "watch" call.

Example of the "observe" method of vehicles:
```.js
mojio_client.observe(vehicle, null,
    (entity) ->
        entity.should.be.an.instanceOf(Object)
        console.log("Observed change seen.")
        mojio_client.unobserve(observer, vehicle, null, null, (error, result) ->
            result.should.be.an.instanceOf(Observer)
        )
    ,
    (error, result) ->
        result.Status.should.equal("Approved")
    )
```
Example of the "watch" method with a conditional observer.
```.js
observer = new Observer(
    {
        ObserverType: "Speed", Status: "Approved", SpeedLow: 80.0, Name: "Test"+Math.random(),
        Subject: vehicle.model(), SubjectId: vehicle.id(), "Transports": "SignalR"
    }
)
mojio_client.watch(observer,
    (entity) ->
        entity.should.be.an.instanceOf(Object)
        console.log("Observed change seen.")
        mojio_client.ignore(observer, (error, result) ->
            mojio_client.delete(vehicle, (error, result) ->
                (error==null).should.be.true
                console.log("Vehicle deleted.")
                done()
            )
        )
    ,
    (error, result) ->
        result.should.be.an.instanceOf(Observer)
        result.Status.should.equal("Approved")
    )
```

There are some observer types that can be created:
```.js
       Observer types:
           Generic = 0,
           Script = 1, // not implemented
           Event = 2, // not implemented
```
Conditional Observers on Vehicles:  Pass a vehicle object as the Subject or a Mojio as a parent to Vehicles and get information based on a conditional threshold.  Each Conditional Observer takes a "timing" which can take the values: always=0, low=1, high=2, edge=3, leading=5, trailing=6 which determines when data is sent.

Timings:
```
Always is just a normal observer,
Low sends data when the condition is false every time a notification comes from the Mojio.
High sends data when the condition is true every time a notification comes from the Mojio.
Edge sends data when the condition transitions from low to high or high to low.
Leading sends data when the condition transitions from low to high only.
Trailing sends data when the condition transitions from high to low only.
```
In addition to timing, the condition consists of a high and low value, or a location and radius test against data coming from the vehcile measures.
```.js
           GeoFence = 3,            if Vehicle Location within Location+Radius
           Conditional = 4,         General condition based on:  Field, Threshold1, Threshold2, Operator1, Operator2, Conjunction
           Speed = 5,               if Speed Low < data < Speed High
           Rpm = 6,                 if RPM Low < data < RPM High
           Acceleration = 7,        if Acceleration Low < data < Acceleration High
           Accelerometer = 8,       if Accelerometer Low < data < Accelerometer High
           BatteryVoltage = 9,      if BatteryVoltage Low < data < BatteryVoltage High
           FuelLevel = 10,          if FuelLevel Low < data < FuelLevel High
           Distance = 11,           if Distance Low < data < Distance High
           Odometer = 12,           if Odometer Low < data < Odometer High
           Altitude = 13,           if Altitude Low < data < Altitude High
           Heading = 14,            if Heading Low < data < Heading High
           Diagnostic = 15,
```

These observers are created as follows:
```.js
observer = new Observer(
                        {
                            ObserverType: "Speed", Status: "Approved", SpeedLow: 80.0, Name: "Test"+Math.random(),
                            Subject: vehicle.model(), SubjectId: vehicle.id(), "Transports": "SignalR"
                        }
                    )
```
These are experimental "smooth" observer types: These observers fill in the gaps between sample points based on a time factor.  They each take a "InterpolationRate, and a MaximumTimeForInterpolation value.  The interpolation is the desired time between sample points. The Maximum Time for Interpolation is used to make sure that interpolation of data points is not attempted for long periods of time. The default is five minutes.  The default Interpolation Rate is 1 second.
```.js
           SmoothVehicle = 16,
           SmoothEvent = 17,         // Not implemented
           SmoothTrip = 18,
           SmoothMojio = 19,         # observe Vehicles of a Mojio
           SmoothChunkingMojio = 20  # Sends all interopolations in one message.  Observer vehicles of a mojio.
```
## Build
All javascript client code is in the 'dist' directory.

Code is generate first by running the generator in /src/generate.coffee. The generator makes a request to the schema REST endpoint and retrieves all the schemas for objects stored in the database and creates model files, calls to the REST endpoints in the client, and tests for those calls.

```.sh-session
cd src
coffee generate.coffee
```
You can run "make.sh" to generate the coffeescript files from the templates.  Note that this also builds the javascript from the coffeescript and browserfies the code by calling build.sh.

This creates:
```.sh-session
browser/MojioClient.coffee
nodejs/MojioClient.coffee
models/Address.coffee
models/App.coffee
models/Location.coffee
models/Mojio.coffee
models/Trip.coffee
models/User.coffee
models/Vehicle.coffee
../test/App_test.coffee
../Mojio_test.coffee
../Trip_test.coffee
../User_test.coffee
../Vehicle_test.coffee
```

These files are not created by the generator:
```.sh-session
browser/HttpBrowserWrapper.coffee
nodejs/HttpBrowserWrapper.coffee
models/MojioModel.coffee
models/schema.coffee
../test/crud_test.cofffee
../test/events_test.cofffee
../test/login_test.cofffee
../test/schema_test.cofffee
```

Once the code is generated, it must be compiled from coffeescript to javascript and copied to the dist and lib directories.
Browser based code must be "browserified" to work in a browser.

If you need to manually recompile the code, the steps are:

For nodejs code
```.sh-session
coffee --map --compile src/nodejs
cp src/nodejs/*.js lib/
```
For browser code
```.sh-session
coffee --map --compile src/browser
cd src/browser
browserify -r ./HttpBrowserWrapper.js --standalone HttpBrowserWrapper > ../../dist/browser/HttpBrowserWrapper.js
browserify -r ./MojioClient.js --standalone Mojio > ../../dist/browser/MojioClient.js
```

You can also just run the builder by typing:
```.sh-session
./build.sh
```
This will build the javascript and browserfy code.

## Todo:


* Hyperlinks for resources
* NodeJS OAuth2 implementation and documentation: https://www.npmjs.org/package/simple-oauth2
