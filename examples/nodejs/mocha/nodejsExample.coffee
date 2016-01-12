#MojioClient = require '../../lib/nodejs/MojioClient'
#User = require '../../lib/models/User'
#Vehicle = require '../../lib/models/Vehicle'
#Trip = require '../../lib/models/Trip'

Mojio = require 'mojio-js'
async = require 'async'
config =     {
    application: 'bcafb90b-95b5-406f-8d2a-ad2cb7401df6',
    secret: '1e877bcf-3274-4ce9-8a16-7880dff3b3a3',
    hostname: 'api.moj.io',
    version: 'v1',
    port:'443',
    scheme:'https',
    signalr_port:'80',
    signalr_scheme:'http',
    live: false
}
testdata = {
    username: 'unittest@moj.io'
    password: 'Password007!'
}
assert = require('assert')
should = require('should')
mojio_client = new Mojio(config)
User = mojio_client.model("User")
Vehicle = mojio_client.model("Vehicle")
Trip = mojio_client.model("Trip")
describe 'Stuff', ->
    it 'can do stuff', (done) ->
        mojio_client.login(testdata.username, testdata.password, (error, result) ->
            if error?
                console.log("Error:"+error)
            else
                console.log("Results:"+JSON.stringify(result))
                mojio_client.getCurrentUser((error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results: User Email:"+result.Email)
                        mojio_client.get(Vehicle, {}, (error, result) ->
                            if error?
                                console.log("Error:"+error)
                            else
                                console.log("Results:"+JSON.stringify(result.Data))
                                mojio_client.query(Trip, {}, (error, result) ->
                                    if error?
                                        console.log("Error:"+error)
                                    else
                                        console.log("Results:"+JSON.stringify(result.Data))
                                        done()
                                )
                        )
                )
                mojio_client.query(User, {criteria: {Email: 'unittest@moj.io'}, limit: 10}, (error, result) ->
                    (error==null).should.be.true
                    console.log("Results by criteria:"+JSON.stringify(result.Data))
                )
        )
    it 'can do async stuff', (done) ->

        async.waterfall([
            (cb) ->
                results = {}
                mojio_client.login(testdata.username, testdata.password, (error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results:"+JSON.stringify(result))
                        results.token = result
                    cb(error,results)
                    return
                )
            (results, cb) ->
                mojio_client.getCurrentUser((error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results: User Email:"+result.Email)
                        results.user = result
                    cb(error,results)
                    return
                )
            (results, cb) ->
                mojio_client.query(User, {criteria: {Email: 'unittest@moj.io'}, limit: 10}, (error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results: User Email:"+result.Data[0].Email)
                        results.usersByQuery = result.Data
                    cb(error,results)
                )

            (results, cb) ->
                mojio_client.get(Vehicle, {}, (error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results:"+JSON.stringify(result.Data))
                        results.vehicles = result.Data
                    cb(error,results)
                )
            (results, cb) ->
                mojio_client.query(Trip, {}, (error, result) ->
                    if error?
                        console.log("Error:"+error)
                    else
                        console.log("Results:"+JSON.stringify(result.Data))
                    cb(error,results)
                )
            ],
            (error,results) ->
                console.log("Results:"+results)
                done()
        )
