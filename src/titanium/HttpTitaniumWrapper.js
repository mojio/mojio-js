// Generated by CoffeeScript 1.9.3
(function() {
  var HttpTitaniumWrapper;

  module.exports = HttpTitaniumWrapper = (function() {
    var Http;

    function HttpTitaniumWrapper(applicationName) {
      if (applicationName == null) {
        applicationName = null;
      }
      if (applicationName != null) {
        this.applicationName = applicationName;
      }
    }

    Http = Ti.Network.createHTTPClient({
      onload: function(e) {
        Ti.API.info("Received text: " + this.responseText);
        return alert('success');
      },
      onerror: function(e) {
        Ti.API.debug(e.error);
        return alert('error');
      },
      timeout: 5000
    });

    HttpTitaniumWrapper.prototype.resquest = function(params, callback) {
      var accessToken, headers, method, resource, url;
      url = params.scheme + ":#" + params.host + ":" + params.port + params.path;
      method = params.method;
      resource = params.header;
      Ti.API.info("before url: " + url);
      if (params.method === "GET" && (params.data !== null) && params.data.length > 0) {
        url += '?' + Object.keys(params.data).map(function(k) {
          return encodeURIComponent(k) + '=' + encodeURIComponent(params.data[k]);
        }).join('&');
      }
      headers = null;
      Ti.API.info("params.header: " + params.headers);
      Ti.API.info("params.lenght: " + params.headers.length);
      if (params.method === "GET" && (params.headers !== null)) {
        headers = Object.keys(params.headers).map(function(k) {
          return encodeURIComponent(k) + '=' + encodeURIComponent(params.headers[k]);
        }).join('&');
      }
      Ti.API.info("MojioAPIToken index  " + headers.indexOf("MojioAPIToken"));
      if (headers.indexOf("MojioAPIToken") !== -1) {
        accessToken = headers.substring(headers.indexOf("MojioAPIToken") + 14, headers.indexOf("&"));
        Ti.API.info("Token   " + accessToken);
      }
      Ti.API.info("params.header: " + headers);
      Ti.API.info("after url: " + url);
      Ti.API.info("params.method: " + params.method);
      Ti.API.info("params.path: " + params.path);
      Ti.API.info("url: " + url);
      Http.onload = callback;
      Http.open(method, url);
      if (headers.indexOf("MojioAPIToken") !== -1) {
        Http.setRequestHeader("MojioAPIToken", accessToken);
      }
      return Http.send();
    };

    HttpTitaniumWrapper.prototype.redirect = function(params, callback) {
      var url, webview;
      url = params.scheme + "://" + params.host + ":" + params.port + params.path;
      webview = Titanium.UI.createWebView();
      Ti.API.info("webview");
      webview.setUrl(url);
      webview.addEventListener('load', function(e) {
        var accessToken, tokenIndex;
        if (e.url.indexOf(this.applicationName) === 0) {
          e.bubble = false;
          webview.stopLoading();
          tokenIndex = e.url.indexOf("token");
          accessToken = e.url.substring(tokenIndex + 6, tokenIndex + 42);
          webview.setVisible(false);
          webview.hide();
          window.remove(webview);
          window.close();
          return callback(null, accessToken);
        }
      });
      return webview;
    };

    return HttpTitaniumWrapper;

  })();

}).call(this);

//# sourceMappingURL=HttpTitaniumWrapper.js.map
