// Generated by CoffeeScript 1.9.2
(function () {
    var Http, MojioClient, SignalR;

    Http = require('./HttpTitaniumWrapper');

    SignalR = 'tbd';//require('./SignalRTitaniumWrapper');
    //----> zhe
    var appname = "";
    var accessToken = null;

    Ti.API.info("DON\"T LOAD SingnalR!!");
    // zhe <--------
    module.exports = MojioClient = (function () {
        var App, Event, Mojio, Observer, Product, Subscription, Trip, User, Vehicle, defaults, mojio_models, authorized;

        defaults = {
            hostname: 'api.moj.io',
            port: '443',
            version: 'v1',
            scheme: 'https',
            signalr_scheme: 'https',
            signalr_port: '443',
            signalr_hub: 'ObserverHub',
            live: true
        };

        //----> zhe
        authorized = false;

        function MojioClient(options) {
            var base, base1, base2, base3, base4, base5, base6, base7;
            this.options = options;
            if (this.options == null) {
                this.options = {
                    hostname: this.defaults.hostname,
                    port: this.defaults.port,
                    version: this.defaults.version,
                    scheme: this.defaults.scheme,
                    live: this.defaults.live
                };
            }
            if ((base = this.options).hostname == null) {
                base.hostname = defaults.hostname;
            }
            if ((base1 = this.options).port == null) {
                base1.port = defaults.port;
            }
            if ((base2 = this.options).version == null) {
                base2.version = defaults.version;
            }
            if ((base3 = this.options).scheme == null) {
                base3.scheme = defaults.scheme;
            }
            if ((base4 = this.options).signalr_port == null) {
                base4.signalr_port = defaults.signalr_port;
            }
            if ((base5 = this.options).signalr_scheme == null) {
                base5.signalr_scheme = defaults.signalr_scheme;
            }
            if ((base6 = this.options).signalr_hub == null) {
                base6.signalr_hub = defaults.signalr_hub;
            }
            this.options.application = this.options.application;
            this.options.secret = this.options.secret;
            this.options.observerTransport = 'SingalR';
            this.conn = null;
            this.hub = null;
            this.connStatus = null;
            this.auth_token = null;
            //----> zhe
            this.access_token = null; //tbd
            if ((base7 = this.options).tokenRequester == null) {
                base7.tokenRequester = (function () {
                    return document.location.hash.match(/access_token=([0-9a-f-]{36})/);
                });
            }
            //----> zhe
            //this.signalr = new SignalR(this.options.signalr_scheme + "://" + this.options.hostname + ":" + this.options.signalr_port + "/v1/signalr", [this.options.signalr_hub]);
        }


        /*
         Helpers
         */

        MojioClient.prototype.getResults = function (type, results) {
            var arrlength, i, j, len, len1, objects, ref, result;
            //----> zhe
            var testresults;

            Ti.API.info("test getResults, results is" + results);
            // zhe <--------

            objects = [];
            if (results instanceof Array) {
                arrlength = results.length;
                for (i = 0, len = results.length; i < len; i++) {
                    result = results[i];
                    objects.push(new type(result));
                }
            } else if (results.Data instanceof Array) {
                arrlength = results.Data.length;
                ref = results.Data;
                for (j = 0, len1 = ref.length; j < len1; j++) {
                    result = ref[j];
                    // -----> zhe
                    Ti.API.info("result is : " + result);
                    Ti.API.info("ref is : " + JSON.stringify(result));
                    LastLocation = result.LastLocation;
                    Ti.API.info("LastLocation : " + LastLocation);
                    Lat = LastLocation.Lat;
                    Ti.API.info("Lat : " + Lat);
                    // zhe <--------
                    objects.push(new type(result));
                }
            } else if (result.Data !== null) {
                objects.push(new type(result.Data));
            }
            else {
                objects.push(new type(result));
            }
            return objects;
        };

        MojioClient._makeParameters = function (params) {
            var property, query, value;
            if (params.length === 0) {
                '';
            }
            query = '?';
            for (property in params) {
                value = params[property];
                query += (encodeURIComponent(property)) + "=" + (encodeURIComponent(value)) + "&";
            }
            return query.slice(0, -1);
        };

        MojioClient.prototype.getPath = function (resource, id, action, key) {
            if (key && id && action && id !== '' && action !== '') {
                return "/" + encodeURIComponent(resource) + "/" + encodeURIComponent(id) + "/" + encodeURIComponent(action) + "/" + encodeURIComponent(key);
            } else if (id && action && id !== '' && action !== '') {
                return "/" + encodeURIComponent(resource) + "/" + encodeURIComponent(id) + "/" + encodeURIComponent(action);
            } else if (id && id !== '') {
                return "/" + encodeURIComponent(resource) + "/" + encodeURIComponent(id);
            } else if (action && action !== '') {
                return "/" + encodeURIComponent(resource) + "/" + encodeURIComponent(action);
            }
            return "/" + encodeURIComponent(resource);
        };

        MojioClient.prototype.dataByMethod = function (data, method) {
            switch (method.toUpperCase()) {
                case 'POST' || 'PUT':
                    return this.stringify(data);
                default:
                    return data;
            }
        };

        MojioClient.prototype.stringify = function (data) {
            return JSON.stringify(data);
        };

        MojioClient.prototype.request = function (request, callback) {
            var http, parts;
            parts = {
                hostname: this.options.hostname,
                host: this.options.hostname,
                port: this.options.port,
                scheme: this.options.scheme,
                path: '/' + this.options.version,
                method: request.method,
                withCredentials: false
            };
            parts.path = '/' + this.options.version + this.getPath(request.resource, request.id, request.action, request.key);
            if ((request.parameters != null) && Object.keys(request.parameters).length > 0) {
                parts.path += MojioClient._makeParameters(request.parameters);
            }
            parts.headers = {};
            if (this.getTokenId() != null) {
                parts.headers["MojioAPIToken"] = this.getTokenId();
            }
            if ((request.headers != null)) {
                parts.headers += request.headers;
            }
            parts.headers["Content-Type"] = 'application/json';
            if (request.body != null) {
                parts.body = request.body;
            }
            http = new Http();
            return http.request(parts, callback);
        };


        /*
         Authorize and Login
         */

        MojioClient.prototype.login_resource = 'Login';

        MojioClient.prototype.authorize = function (redirect_url, scope, callback) {
            //----> zhe
            appname = this.options.appname;
            if (accessToken !== null) {
                //MojioClient.prototype.token(callback);
                //do something
            }
            else {
            // zhe <--------
                var parts, url;
                if (scope == null) {
                    scope = 'full';
                }
                parts = {
                    hostname: this.options.hostname,
                    host: this.options.hostname,
                    port: this.options.port,
                    scheme: this.options.scheme,
                    path: this.options.live ? '/OAuth2/authorize' : '/OAuth2Sandbox/authorize',
                    method: 'Get',
                    withCredentials: false
                };
                parts.path += "?response_type=token";
                parts.path += "&client_id=" + this.options.application;
                parts.path += "&redirect_uri=" + redirect_url;
                parts.path += "&scope=" + scope;
                parts.headers = {};
                if (this.getTokenId() != null) {
                    parts.headers["MojioAPIToken"] = this.getTokenId();
                }
                parts.headers["Content-Type"] = 'application/json';
                url = parts.scheme + "://" + parts.host + ":" + parts.port + parts.path;
                //----> zhe
                var webview = Titanium.UI.createWebView();
                Ti.API.info("webview");
                webview.setUrl(url);
                webview.addEventListener('load', function (e) {
                    //TPD, detect the status
                    if (e.url.indexOf(appname) === 0) {


                        // stop the event
                        e.bubble = false;
                        // stop the url from loading
                        webview.stopLoading();

                        //localize the accessToken from the redirected URL
                        var tokenIndex = e.url.indexOf("token");
                        accessToken = e.url.substring(tokenIndex + 6, tokenIndex + 42);    //e.url.toString();//

                        // Titanium.UI.createAlertDialog({title:'AcessToken', message:accessToken}).show();

                        //obtain
                        //obtainData(accessToken);
                        Ti.API.info("obtained token: " + accessToken);
                        authorized = true;

                        webview.setVisible(false);
                        webview.hide();
                        window.remove(webview);
                        window.close();
                    }
                });
                return webview;
            }
            //<----- zhe
            //return window.location = url;
        };

        // -----------> zhe
        MojioClient.prototype.isauthorized = function () {
            return authorized;
        };
	//zhe <-----
        MojioClient.prototype.token = function (callback) {
            var match, token;
            this.user = null;
	    //----> zhe
            match = accessToken;//this.options.tokenRequester();
            token = accessToken;//!!match && match[1];
            // zhe <-------
            if (!token) {
                return callback("token for authorization not found.", null);
            } else {
                return this.request({
                    method: 'GET',
                    resource: this.login_resource,
                    id: token
                }, (function (_this) {
                    return function (e, result) {
                        var error = e.error; // zhe <-----
                        if (error) {
                            return callback(error, null);
                        } else {
                            _this.auth_token = JSON.parse(this.responseText); // zhe <----

                            return callback(null, _this.auth_token);
                        }
                    };
                })(this));
            }
        };
        // --------> zhe
        MojioClient.prototype.showtoken = function () {
            if (accessToken == null) {
                alert("haven't got the token yet!");
            }

            return accessToken;
        };
        // zhe <------
        MojioClient.prototype.unauthorize = function (redirect_url) {
            var parts, url;
            parts = {
                hostname: this.options.hostname,
                host: this.options.hostname,
                port: this.options.port,
                scheme: this.options.scheme,
                path: '/account/logout',
                method: 'Get',
                withCredentials: false
            };
            parts.path += "?Guid=" + this.getTokenId();
            parts.path += "&client_id=" + this.options.application;
            parts.path += "&redirect_uri=" + redirect_url;
            parts.headers = {};
            if (this.getTokenId() != null) {
                parts.headers["MojioAPIToken"] = this.getTokenId();
            }
            parts.headers["Content-Type"] = 'application/json';
            url = parts.scheme + "://" + parts.host + ":" + parts.port + parts.path;
            // --------> zhe
            var webview = Titanium.UI.createWebView();
            webview.setUrl(url);

            return webview;
            authorized = false;

            // zhe <---------
            //return window.location = url; // zhe <-----
        };

        MojioClient.prototype._login = function (username, password, callback) {
            return this.request({
                method: 'POST',
                resource: this.login_resource,
                id: this.options.application,
                parameters: {
                    userOrEmail: username,
                    password: password,
                    secretKey: this.options.secret
                }
            }, callback);
        };

        MojioClient.prototype.login = function (username, password, callback) {
            return this._login(username, password, (function (_this) {
                return function (error, result) {
                    if ((result != null)) {
                        _this.auth_token = result;
                    }
                    return callback(error, result);
                };
            })(this));
        };

        MojioClient.prototype._logout = function (callback) {
            return this.request({
                method: 'DELETE',
                resource: this.login_resource,
                id: typeof mojio_token !== "undefined" && mojio_token !== null ? mojio_token : this.getTokenId()
            }, callback);
        };

        MojioClient.prototype.logout = function (callback) {
            return this._logout((function (_this) {
                return function (error, result) {
                    _this.auth_token = null;
                    return callback(error, result);
                };
            })(this));
        };

        mojio_models = {};

        App = require('../models/App');

        mojio_models['App'] = App;

        Mojio = require('../models/Mojio');

        mojio_models['Mojio'] = Mojio;

        Trip = require('../models/Trip');

        mojio_models['Trip'] = Trip;

        User = require('../models/User');

        mojio_models['User'] = User;

        Vehicle = require('../models/Vehicle');

        mojio_models['Vehicle'] = Vehicle;

        Product = require('../models/Product');

        mojio_models['Product'] = Product;

        Subscription = require('../models/Subscription');

        mojio_models['Subscription'] = Subscription;

        Event = require('../models/Event');

        mojio_models['Event'] = Event;

        Observer = require('../models/Observer');

        mojio_models['Observer'] = Observer;

        MojioClient.prototype.model = function (type, json) {
            var data, i, len, object, ref;
            if (json == null) {
                json = null;
            }
            if (json === null) {
                return mojio_models[type];
            } else if ((json.Data != null) && json.Data instanceof Array) {
                object = json;
                object.Objects = new Array();
                ref = json.Data;
                for (i = 0, len = ref.length; i < len; i++) {
                    data = ref[i];
                    object.Objects.push(new mojio_models[type](data));
                }
            } else if ((json.Data != null)) {
                object = new mojio_models[type](json.Data);
            } else {
                object = new mojio_models[type](json);
            }
            object._client = this;
            return object;
        };

        MojioClient.prototype.query = function (model, parameters, callback) {
            var property, query_criteria, ref, value;
            if (parameters instanceof Object) {
                if (parameters.criteria instanceof Object) {
                    query_criteria = "";
                    ref = parameters.criteria;
                    for (property in ref) {
                        value = ref[property];
                        query_criteria += property + "=" + value + ";";
                    }
                    parameters.criteria = query_criteria;
                }
                return this.request({
                    method: 'GET',
                    resource: model.resource(),
                    parameters: parameters
                }, (function (_this) {
                    return function (error, result) {
                        result = JSON.parse(this.responseText); // zhe <--------
                        return callback(error, _this.model(model.model(), result));
                    };
                })(this));
            } else if (typeof parameters === "string") {
                return this.request({
                    method: 'GET',
                    resource: model.resource(),
                    parameters: {
                        id: parameters
                    }
                }, (function (_this) {
                    return function (error, result) {
                        result = JSON.parse(this.responseText); // zhe <--------
                        return callback(error, _this.model(model.model(), result));
                    };
                })(this));
            } else {
                return callback("criteria given is not in understood format, string or object.", null);
            }
        };

        MojioClient.prototype.get = function (model, criteria, callback) {
            return this.query(model, criteria, callback);
        };

        MojioClient.prototype.save = function (model, callback) {
            return this.request({
                method: 'PUT',
                resource: model.resource(),
                body: model.stringify(),
                parameters: {
                    id: model._id
                }
            }, callback);
        };

        MojioClient.prototype.put = function (model, callback) {
            return this.save(model, callback);
        };

        MojioClient.prototype.create = function (model, callback) {
            return this.request({
                method: 'POST',
                resource: model.resource(),
                body: model.stringify()
            }, callback);
        };

        MojioClient.prototype.post = function (model, callback) {
            return this.create(model, callback);
        };

        MojioClient.prototype["delete"] = function (model, callback) {
            return this.request({
                method: 'DELETE',
                resource: model.resource(),
                parameters: {
                    id: model._id
                }
            }, callback);
        };


        /*
         Schema
         */

        MojioClient.prototype._schema = function (callback) {
            return this.request({
                method: 'GET',
                resource: 'Schema'
            }, callback);
        };

        MojioClient.prototype.schema = function (callback) {
            return this._schema((function (_this) {
                return function (error, result) {
                    return callback(error, result);
                };
            })(this));
        };


        /*
         Observers
         */

        MojioClient.prototype.watch = function (observer, observer_callback, callback) {
            return this.request({
                method: 'POST',
                resource: Observer.resource(),
                body: observer.stringify()
            }, (function (_this) {
                return function (error, result) {
                    if (error) {
                        return callback(error, null);
                    } else {
                        observer = new Observer(result);
                        // ------> zhe
                        // _this.signalr.subscribe(_this.options.signalr_hub, 'Subscribe', observer.id(), observer.Subject, observer_callback, function(error, result) {
                        //   return callback(null, observer);
                        // });
                        // zhe <-------
                        return observer;
                    }
                };
            })(this));
        };

        MojioClient.prototype.ignore = function (observer, observer_callback, callback) {
            if (!observer) {
                callback("Observer required.");
            }
            if ((observer['subject'] != null)) {
                if (observer.parent === null) {
                    return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), observer.subject.id(), observer_callback, callback);
                } else {
                    return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), observer.subject.model(), observer_callback, callback);
                }
            } else {
                if (observer.parent === null) {
                    return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), observer.SubjectId, observer_callback, callback);
                } else {
                    return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), observer.Subject, observer_callback, callback);
                }
            }
        };

        MojioClient.prototype.observe = function (subject, parent, observer_callback, callback) {
            var observer;
            if (parent == null) {
                parent = null;
            }
            if (parent === null) {
                observer = new Observer({
                    ObserverType: "Generic",
                    Status: "Approved",
                    Name: "Test" + Math.random(),
                    Subject: subject.model(),
                    SubjectId: subject.id(),
                    "Transports": "SignalR"
                });
                return this.request({
                    method: 'PUT',
                    resource: Observer.resource(),
                    body: observer.stringify()
                }, (function (_this) {
                    return function (error, result) {
                        if (error) {
                            return callback(error, null);
                        } else {
                            observer = new Observer(result);
                            return _this.signalr.subscribe(_this.options.signalr_hub, 'Subscribe', observer.id(), observer.SubjectId, observer_callback, function (error, result) {
                                return callback(null, observer);
                            });
                        }
                    };
                })(this));
            } else {
                observer = new Observer({
                    ObserverType: "Generic",
                    Status: "Approved",
                    Name: "Test" + Math.random(),
                    Subject: subject.model(),
                    Parent: parent.model(),
                    ParentId: parent.id(),
                    "Transports": "SignalR"
                });
                return this.request({
                    method: 'PUT',
                    resource: Observer.resource(),
                    body: observer.stringify()
                }, (function (_this) {
                    return function (error, result) {
                        if (error) {
                            return callback(error, null);
                        } else {
                            observer = new Observer(result);
                            return _this.signalr.subscribe(_this.options.signalr_hub, 'Subscribe', observer.id(), subject.model(), observer_callback, function (error, result) {
                                return callback(null, observer);
                            });
                        }
                    };
                })(this));
            }
        };

        MojioClient.prototype.unobserve = function (observer, subject, parent, observer_callback, callback) {
            if (!observer || (subject == null)) {
                return callback("Observer and subject required.");
            } else if (parent === null) {
                return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), subject.id(), observer_callback, callback);
            } else {
                return this.signalr.unsubscribe(this.options.signalr_hub, 'Unsubscribe', observer.id(), subject.model(), observer_callback, callback);
            }
        };


        /*
         Storage
         */

        MojioClient.prototype.store = function (model, key, value, callback) {
            if (!model || !model._id) {
                return callback("Storage requires an object with a valid id.");
            } else {
                return this.request({
                    method: 'PUT',
                    resource: model.resource(),
                    id: model.id(),
                    action: 'store',
                    key: key,
                    body: JSON.stringify(value)
                }, (function (_this) {
                    return function (error, result) {
                        if (error) {
                            return callback(error, null);
                        } else {
                            return callback(null, result);
                        }
                    };
                })(this));
            }
        };

        MojioClient.prototype.storage = function (model, key, callback) {
            if (!model || !model._id) {
                return callback("Get of storage requires an object with a valid id.");
            } else {
                return this.request({
                    method: 'GET',
                    resource: model.resource(),
                    id: model.id(),
                    action: 'store',
                    key: key
                }, (function (_this) {
                    return function (error, result) {
                        if (error) {
                            return callback(error, null);
                        } else {
                            return callback(null, result);
                        }
                    };
                })(this));
            }
        };

        MojioClient.prototype.unstore = function (model, key, callback) {
            if (!model || !model._id) {
                return callback("Storage requires an object with a valid id.");
            } else {
                return this.request({
                    method: 'DELETE',
                    resource: model.resource(),
                    id: model.id(),
                    action: 'store',
                    key: key
                }, (function (_this) {
                    return function (error, result) {
                        if (error) {
                            return callback(error, null);
                        } else {
                            return callback(null, result);
                        }
                    };
                })(this));
            }
        };


        /*
         Token/User
         */
        // ----------> zhe
        MojioClient.prototype.getToken = function () {
            if (this.auth_token != null) {
                return this.auth_token;
            }
            return null;
        };
        // zhe <------------
        MojioClient.prototype.getTokenId = function () {
            if (this.auth_token != null) {
                return this.auth_token._id;
            }
            return null;
        };

        MojioClient.prototype.getUserId = function () {
            if (this.auth_token != null) {
                return this.auth_token.UserId;
            }
            return null;
        };

        MojioClient.prototype.isLoggedIn = function () {
            return this.getUserId() !== null;
        };

        MojioClient.prototype.getCurrentUser = function (callback) {
            if ((this.user != null)) {
                callback(this.user);
            } else if (this.isLoggedIn()) {
                get('users', this.getUserId()).done(function (user) {
                    if (!(user != null)) {
                        return;
                    }
                    if (this.getUserId() === this.user._id) {
                        this.user = user;
                    }
                    return callback(this.user);
                });
            } else {
                return false;
            }
            return true;
        };

        return MojioClient;

    })();

}).call(this);
