# Gulp stuff.
gulp = require('gulp')
gutil = require('gulp-util')
coffee = require('gulp-coffee')
sourcemaps = require('gulp-sourcemaps')
touch = require('touch')
path = require('path')
tap = require('gulp-tap')

parallelize = require("concurrent-transform")

threads = 100
useSourceMaps = true
coffeeFiles = ['./src/**/*.coffee','test/**/*.coffee','mocha/**/*.coffee']

handleError = (err) ->
    console.log(err.toString())
    @emit('end')

gulp.task('touch', () ->
    gulp.src(coffeeFiles)
    .pipe(
        tap((file, t) ->
            touch(file.path)
        )

    )

)

gulp.task('coffeescripts', () ->
    gulp.src(coffeeFiles)
    .pipe(parallelize(coffee({bare: true}).on('error', gutil.log), threads))
    .pipe(parallelize((if useSourceMaps then sourcemaps.init() else gutil.noop()), threads))
)

gulp.task('watch', () ->
    gulp.watch(coffeeFiles, ['coffeescripts']);
)

gulp.task('default', ['watch', 'coffeescripts'])

gulp.task('done', (() -> ))
