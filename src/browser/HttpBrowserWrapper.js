// Generated by CoffeeScript 1.9.3
(function() {
  var HttpBrowserWrapper;

  module.exports = HttpBrowserWrapper = (function() {
    function HttpBrowserWrapper(requester) {
      if (requester == null) {
        requester = null;
      }
      if (requester != null) {
        this.requester = requester;
      }
    }

    HttpBrowserWrapper.prototype.request = function(params, callback) {
      var k, ref, url, v, xmlhttp;
      if (params.method == null) {
        params.method = "GET";
      }
      if ((params.host == null) && (params.hostname != null)) {
        params.host = params.hostname;
      }
      if (!((params.scheme != null) || (typeof window === "undefined" || window === null))) {
        params.scheme = window.location.protocol.split(':')[0];
      }
      if (!params.scheme || params.scheme === 'file') {
        params.scheme = 'https';
      }
      if (params.data == null) {
        params.data = {};
      }
      if (params.body != null) {
        params.data = params.body;
      }
      if (params.headers == null) {
        params.headers = {};
      }
      url = params.scheme + "://" + params.host + ":" + params.port + params.path;
      if (params.method === "GET" && (params.data != null) && params.data.length > 0) {
        url += '?' + Object.keys(params.data).map(function(k) {
          return encodeURIComponent(k) + '=' + encodeURIComponent(params.data[k]);
        }).join('&');
      }
      if ((typeof XMLHttpRequest !== "undefined" && XMLHttpRequest !== null)) {
        xmlhttp = new XMLHttpRequest;
      } else {
        xmlhttp = this.requester;
      }
      xmlhttp.open(params.method, url, true);
      ref = params.headers;
      for (k in ref) {
        v = ref[k];
        xmlhttp.setRequestHeader(k, v);
      }
      xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState === 4) {
          if (xmlhttp.status >= 200 && xmlhttp.status <= 299) {
            return callback(null, JSON.parse(xmlhttp.responseText));
          } else {
            return callback(xmlhttp.statusText, null);
          }
        }
      };
      if (params.method === "GET") {
        return xmlhttp.send();
      } else {
        return xmlhttp.send(params.data);
      }
    };

    HttpBrowserWrapper.prototype.redirect = function(params, callback) {
      var url;
      url = params.scheme + "://" + params.host + ":" + params.port + params.path;
      return window.location = url;
    };

    return HttpBrowserWrapper;

  })();

}).call(this);
