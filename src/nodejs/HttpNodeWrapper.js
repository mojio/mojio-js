// Generated by CoffeeScript 1.9.3
(function() {
  var Http, HttpNodeWrapper, Https, constants;

  Http = require('http');

  Https = require('https');

  constants = require('constants');

  module.exports = HttpNodeWrapper = (function() {
    function HttpNodeWrapper() {}

    HttpNodeWrapper.prototype.request = function(params, callback) {
      var action;
      if (params.scheme === 'https') {
        action = Https.request(params);
      } else {
        action = Http.request(params);
      }
      action.on('response', function(response) {
        var data;
        if (typeof window === "undefined" || window === null) {
          response.setEncoding('utf8');
        }
        data = "";
        response.on('data', function(chunk) {
          if (chunk) {
            return data += chunk;
          }
        });
        return response.on('end', function() {
          var error;
          if (response.statusCode > 299) {
            response.content = data;
            return callback(response, null);
          } else if (data.length > 0) {
            try {
              return callback(null, JSON.parse(data));
            } catch (_error) {
              error = _error;
              return callback(data, null);
            }
          } else {
            return callback(null, {
              result: "ok"
            });
          }
        });
      });
      if ((params != null ? params.timeout : void 0) != null) {
        action.on('socket', function(socket) {
          socket.setTimeout(params.timeout);
          return socket.on('timeout', function() {
            return callback(socket, null);
          });
        });
      }
      action.on('error', function(error) {
        return callback(error, null);
      });
      if ((params.body != null)) {
        action.write(params.body);
      }
      return action.end();
    };

    HttpNodeWrapper.prototype.redirect = function(params, callback) {
      return this.request(params, callback);
    };

    return HttpNodeWrapper;

  })();

}).call(this);

//# sourceMappingURL=HttpNodeWrapper.js.map
