MojioClient = require '../lib/nodejs/MojioClient'
Observer = require '../lib/models/Observer'
App = require '../lib/models/App'
Mojio = require '../lib/models/Mojio'
Vehicle = require '../lib/models/Vehicle'
Event = require '../lib/models/Event'
config = require './config/mojio-config.coffee'
mojio_client = new MojioClient(config)
assert = require('assert')
testdata = require('./data/mojio-test-data')
should = require('should')
count = [0,0]
app1=null
app2=null
observer = null
theevent = null
vehicle = null

describe 'Observer', ->

    before( (done) ->
        mojio_client._login(testdata.username, testdata.password, (error, result) ->
            (error==null).should.be.true
            done()
        )
    )

    #    # test Observer
    it 'can Observe Newly Created Object', (done) ->
        app = new App().mock()

        mojio_client.post(app, (error, result) ->
            (error==null).should.be.true
            app = new App(result)
            console.log("created app")
            mojio_client.observe(app, null,
                (entity) ->
                    entity.should.be.an.instanceOf(Object)
                    console.log("Observed change seen.")
                    mojio_client.unobserve(observer, app, null, null, (error, result) ->
                        mojio_client.delete(app, (error, result) ->
                            (error==null).should.be.true
                            console.log("App deleted.")
                            done()
                        )
                    )
                ,
                (error, result) ->
                    result.Status.should.equal("Approved")

                    app.Description = "Changed"
                    console.log("changing app...")
                    result.should.be.an.instanceOf(Observer)
                    observer = result

                    mojio_client.put(app, (error, result) ->
                        (error==null).should.be.true
                        console.log("App changed.")
                    )
                )
        )

    # test Observer
    it 'can Observe Events of Vehicle', (done) ->
        mojio = new Mojio().mock()

        theevent = null
        mojio_client.create(mojio, (error, result) ->
            (error==null).should.be.true
            mojio = new Mojio(result)
            vehicle = new Vehicle().mock()
            vehicle.MojioId = mojio.id()

            mojio_client.create(vehicle, (error, result) ->
                (error==null).should.be.true
                vehicle = new Vehicle(result)
                console.log("created vehicle")
                theevent = null
                mojio_client.observe(Event, vehicle,
                    (entity) =>
                        entity.should.be.an.instanceOf(Object)
                        console.log("Observed change seen.")
                        if (entity.Type == 'Vehicle')
                            console.log("Vehicle Changed")
                        else
                            console.log("Event Added to Vehicle.")

                            mojio_client.unobserve(observer, Event, vehicle, null, (error, result) =>
#                                result.should.be.an.instanceOf(Observer)
                                mojio_client.delete(theevent, (error, result) =>
                                    (error==null).should.be.true
                                    console.log("Event deleted.")
                                    mojio_client.delete(vehicle, (error, result) =>
                                        (error==null).should.be.true
                                        console.log("Vehicle deleted.")
                                        done()
                                    )
                                )
                            )
                    ,
                    (error, result) =>
                        #result.Status.should.equal("Approved")
                        result.should.be.an.instanceOf(Observer)
                        observer = result
                        event = new Event().mock()
                        event.Type = 'Event'
                        event.EventType = 'TripEvent'
                        event.VehicleId = vehicle.id()
                        event.MojioId = mojio.id()
                        event.Time = new Date()
                        event.Location = { Lat: 49.8, Lng: 112.0}

                        console.log("creating event")
                        mojio_client.create(event, (error, result) =>
                            theevent = new Event(result)
                            (error==null).should.be.true
                            console.log("event created.")
                        )
                )
            )
        )

    it 'can Observe Object', (done) ->
        mojio_client.get(App, {}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            instance.should.be.an.instanceOf(App) for instance in result.Objects

            app = new App(result.Objects[0])
            console.log("retreived app")

            mojio_client.observe(app, null,
            (entity) ->
                entity.should.be.an.instanceOf(Object)
                console.log("Observed change seen.")
                mojio_client.unobserve(observer, app, null, null, (error, result) ->
#                    result.should.be.an.instanceOf(Observer)
                    done()
                )
            ,
            (error, result) ->
                app.Description = "Changed"
                console.log("changing app...")
                result.should.be.an.instanceOf(Observer)
                observer = result

                mojio_client.put(app, (error, result) ->
                    (error==null).should.be.true
                    console.log("App changed.")
                )
                app.Description = "An Anonymous Application"

                mojio_client.put(app, (error, result) ->
                    (error==null).should.be.true
                    console.log("App changed back.")
                )
            )
        )

    it 'can Observe 2 Objects Separately.', (done) ->
        app = new App().mock()

        doubleDone = (which) ->
            count[which]++
            if (count[0] > 1 && count[1] > 1)
                done()
            else if (count[0] > 2 || count[1] > 2)
                true.should.be.false

        mojio_client.get(App, {}, (error, result) ->
            (error==null).should.be.true
            mojio_client.should.be.an.instanceOf(MojioClient)
            result.Objects.should.be.an.instanceOf(Array)
            instance.should.be.an.instanceOf(App) for instance in result.Objects
            app1 = new App(result.Objects[0])
            app2 = new App(result.Objects[1])

            mojio_client.observe(app2, null,
                # Callback for app1.
                (entity) ->
                    entity.should.be.an.instanceOf(Object)
                    console.log("observed change app1")
                    entity._id.should.be.equal(app2._id)
                    doubleDone(0)
                ,
                (error, result) ->
                    (error==null).should.be.true
                    result.Status.should.equal("Approved")

                    mojio_client.observe(app1, null,
                        # Callback for app2.
                        (entity) ->
                            entity.should.be.an.instanceOf(Object)
                            console.log("observed change app2")
                            entity._id.should.be.equal(app1._id)
                            doubleDone(1)
                        ,
                        (error, result) ->
                            (error==null).should.be.true
                            result.Status.should.equal("Approved")
                            app1.Description = "Changed1"
                            mojio_client.put(app1, (error, result) ->
                                (error==null).should.be.true
                                console.log("updated app1")
                                app1.Description = "Default"
                                mojio_client.put(app1, (error, result) ->
                                    (error==null).should.be.true
                                    app2.Description = "Changed2"
                                    mojio_client.put(app2, (error, result) ->
                                        (error==null).should.be.true
                                        console.log("updated app2")
                                        app2.Description = "Anonymous Application"
                                        mojio_client.put(app2, (error, result) ->
                                            (error==null).should.be.true
                                        )
                                    )
                                )
                            )

                        )
                )
        )