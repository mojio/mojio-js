MojioClient = require '../../lib/nodejs/MojioClient'
Trip = require '../../lib/models/Trip'
config = require './../config/mojio-config.coffee'
mojio_client = new MojioClient(config)
assert = require('assert')
testdata = require('./../data/mojio-test-data')
should = require('should')

testObject = null

describe 'Trip', ->

    before( (done) ->
        mojio_client.login(testdata.username, testdata.password, (error, result) ->
            (error==null).should.be.true
            done()
        )
    )

    # test Trip
    it 'can get Trips from Model', (done) ->
        trip = new Trip({})
        trip.authorization(mojio_client)

        trip.query({}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            if (result.Objects? and result.Objects instanceof (Array))
                instance.should.be.an.instanceOf(Trip) for instance in result.Objects
                testObject = instance  # save for later reference.
            else
                result.should.be.an.instanceOf(Trip)
                testObject = result
            done()
        )

    it 'can get Trips', (done) ->

        mojio_client.query(Trip, {}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            instance.should.be.an.instanceOf(Trip) for instance in result.Objects
            done()
        )
