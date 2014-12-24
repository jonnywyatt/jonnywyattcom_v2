var gulp = require('gulp');
var sass = require('gulp-sass');
var sourcemaps = require('gulp-sourcemaps');

gulp.task('watch', function() {
    gulp.watch('./app/assets/stylesheets/**/*.scss', ['sass']);
});

gulp.task('sass', function () {
  gulp.src('./app/assets/stylesheets/application.scss')
      .pipe(sourcemaps.init())
      .pipe(sass({
          errLogToConsole: true
      }))
      .pipe(sourcemaps.write())
      .pipe(gulp.dest('./app/assets/stylesheets/'));
});