var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('watch', function () {
  gulp.watch('./app/assets/stylesheets/**/*.scss', ['sass']);
});

gulp.task('sass', function () {
  gulp.src('./app/assets/stylesheets/application.scss')
      .pipe(sourcemaps.init())
      .pipe(sass({
        errLogToConsole: true
      }))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('./app/assets/stylesheets/'))
      .pipe(gulp.dest('./public/stylesheets/'));
});

gulp.task('js', function () {
  gulp.src('./vendor/assets/bower_components/requirejs/require.js')
      .pipe(gulp.dest('./public/javascripts/requirejs'));
  gulp.src('./app/assets/javascripts/*.js', {base: './app/assets/javascripts'})
      .pipe(gulp.dest('./public/assets/'));
});
