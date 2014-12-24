require.config({
  baseUrl: '/assets',
  paths: {
    jquery: 'jquery/dist/jquery',
    tinyMCE: 'tinymce/tinymce.min'
  },

  shim: {
    tinyMCE: {
      deps: ['jquery'],
      exports: 'tinyMCE'
    }
  },
  //Sets the logging level. It is a number. If you want "silent" running,
  //set logLevel to 4. From the logger.js file:
  //TRACE: 0,
  //INFO: 1,
  //WARN: 2,
  //ERROR: 3,
  //SILENT: 4
  //Default is 0.
  logLevel: 1
});