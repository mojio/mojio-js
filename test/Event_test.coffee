MojioClient = require '../lib/nodejs/MojioClient'
Event = require '../lib/models/Event'
config = require './config/mojio-config.coffee'
mojio_client = new MojioClient(config)
assert = require('assert')
testdata = require('./data/mojio-test-data')
should = require('should')

testObject = null

describe 'Event', ->

    before( (done) ->
        mojio_client._login(testdata.username, testdata.password, (error, result) ->
            (error==null).should.be.true
            done()
        )
    )

    # test Event
    it 'can get Events from Model', (done) ->
        event = new Event({})
        event.authorization(mojio_client)

        event.query({}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            if (result.Objects? and result.Objects instanceof (Array))
                instance.should.be.an.instanceOf(Event) for instance in result.Objects
                testObject = instance  # save for later reference.
            else
                result.should.be.an.instanceOf(Event)
                testObject = result
            done()
        )

    it 'can get Events', (done) ->

        mojio_client.query(Event, {}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            instance.should.be.an.instanceOf(Event) for instance in result.Objects
            done()
        )
