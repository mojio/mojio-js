#!/bin/sh
bower install
coffee --compile src/nodejs
coffee --compile src/models
cp src/nodejs/*.js lib/nodejs
cp src/models/*.js lib/models
coffee --compile src/browser
cd src/browser
../../node_modules/.bin/browserify -r ./HttpBrowserWrapper.js --standalone HttpBrowserWrapper > ../../dist/browser/HttpBrowserWrapper.js
../../node_modules/.bin/browserify -r ./MojioClient.js --standalone MojioClient > ../../dist/browser/MojioClient.js
cd ../models
../../node_modules/.bin/browserify -r ./App.js --standalone App > ../../dist/browser/App.js
../../node_modules/.bin/browserify -r ./Event.js --standalone Event > ../../dist/browser/Event.js
../../node_modules/.bin/browserify -r ./Address.js --standalone Address > ../../dist/browser/Address.js
../../node_modules/.bin/browserify -r ./Location.js --standalone Location > ../../dist/browser/Location.js
../../node_modules/.bin/browserify -r ./Mojio.js --standalone Mojio > ../../dist/browser/Mojio.js
../../node_modules/.bin/browserify -r ./Observer.js --standalone Observer > ../../dist/browser/Observer.js
../../node_modules/.bin/browserify -r ./Product.js --standalone Product > ../../dist/browser/Product.js
../../node_modules/.bin/browserify -r ./Subscription.js --standalone Subscription > ../../dist/browser/Subscription.js
../../node_modules/.bin/browserify -r ./Trip.js --standalone Trip > ../../dist/browser/Trip.js
../../node_modules/.bin/browserify -r ./User.js --standalone User > ../../dist/browser/User.js
../../node_modules/.bin/browserify -r ./Vehicle.js --standalone Vehicle > ../../dist/browser/Vehicle.js
cd ../../
# copy the mocha, do this manually until references can be corrected with the move.
# cp mocha/*.js dist/mocha
# cp mocha/*.html dist/mocha
coffee --map --compile test

cd dist/browser
uglifyjs --preamble "// version 3.5.1" Address.js App.js Event.js Location.js Mojio.js Observer.js Product.js \
    Subscription.js Trip.js User.js Vehicle.js -p relative -o ../cdn/mojio-js-models.min.js
uglifyjs --preamble "// version 3.5.1" MojioClient.js -o ../cdn/mojio-js.min.js
cd ../cdn
uglifyjs --preamble "// version 3.5.1" mojio-js-models.min.js -b -o ../cdn/mojio-js-models.js
uglifyjs --preamble "// version 3.5.1" mojio-js.min.js -b -o ../cdn/mojio-js.js
cd ../../
cp package.json ./dist/cdn/package.json


mocha -t 30000 test
