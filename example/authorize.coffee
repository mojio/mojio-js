MojioClient = @MojioClient

###

    Below, fill in your application specific details to make this code work

config =
    application: 'Your-Application-Key-Here' # Fill in your application key here
    redirect_uri: 'Your-Logout-redirect_url-Here' # Fill in your redirect url here (Ex. 'http://localhost:63342/mojio-js/example/authorize_complete.html')
    live: false # Set to true if using the live environment

###
config =
    application: 'bcafb90b-95b5-406f-8d2a-ad2cb7401df6',
    hostname: 'api.moj.io'
    version: 'v1'
    port: '443'
    scheme: 'https'
    redirect_uri: 'http://localhost:63342/mojio-js/example/authorize_complete.html'
    live: false

mojio_client = new MojioClient(config)

(() ->

    if (config.application == 'Your-Application-Key-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set your application key in authorize.coffee or .js.  <br>'
        return
    if (config.application == 'Your-Login-redirect_url-Here')
        div = document.getElementById('result')
        div.innerHTML += 'Mojio Error:: Set the login redirect url in authorize.coffee or .js and register it in your application at the developer center.  <br>'
        return

    mojio_client.authorize(config.redirect_uri)
)()