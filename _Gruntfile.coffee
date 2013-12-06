# Generated on 2013-10-19 using generator-angular 0.5.0
"use strict"

# # Globbing
# for performance reasons we're only matching one level down:
# 'test/spec/{,*/}*.js'
# use this if you want to recursively match all subfolders:
# 'test/spec/**/*.js'
module.exports = (grunt) ->
  require("load-grunt-tasks") grunt
  require("time-grunt") grunt
  grunt.initConfig
    yeoman:
      
      # configurable paths
      app: require("./bower.json").appPath or "app"
      dist: "dist"

    watch:
      coffee:
        files: ["<%= yeoman.app %>/scripts/{,*/}*.coffee"]
        tasks: ["coffee:dist"]

      coffeeTest:
        files: ["test/spec/{,*/}*.coffee"]
        tasks: ["coffee:test"]

      styles:
        files: ["<%= yeoman.app %>/styles/{,*/}*.css"]
        tasks: ["copy:styles", "autoprefixer"]

      livereload:
        options:
          livereload: "<%= connect.options.livereload %>"

        files: [
          "<%= yeoman.app %>/{,*/}*.html", 
          ".tmp/styles/{,*/}*.css", 
          "{.tmp,<%= yeoman.app %>}/scripts/{,*/}*{.js, .coffee}", 
          "<%= yeoman.app %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}"
        ]

    autoprefixer:
      options: ["last 1 version"]
      dist:
        files: [
          expand: true
          cwd: ".tmp/styles/"
          src: "{,*/}*.css"
          dest: ".tmp/styles/"
        ]

    connect:
      options:
        port: 9000
        
        # Change this to '0.0.0.0' to access the server from outside.
        hostname: "localhost"
        livereload: 35729

      livereload:
        options:
          open: true
          base: [".tmp", "<%= yeoman.app %>"]

      test:
        options:
          port: 9001
          base: [".tmp", "test", "<%= yeoman.app %>"]

      dist:
        options:
          base: "<%= yeoman.dist %>"

    clean:
      dist:
        files: [
          dot: true
          src: [".tmp", "<%= yeoman.dist %>/*", "!<%= yeoman.dist %>/.git*"]
        ]

      server: ".tmp"

    jshint:
      options:
        jshintrc: ".jshintrc"

      all: ["Gruntfile.js", "<%= yeoman.app %>/scripts/{,*/}*.js"]

    coffee:
      options:
        sourceMap: true
        sourceRoot: ""

      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/scripts"
          src: "{,*/}*.coffee"
          dest: ".tmp/scripts"
          ext: ".js"
        ]

      test:
        files: [
          expand: true
          cwd: "test/spec"
          src: "{,*/}*.coffee"
          dest: ".tmp/spec"
          ext: ".js"
        ]

    
    # not used since Uglify task does concat,
    # but still available if needed
    #concat: {
    #		 dist: {}
    #		 },
    rev:
      dist:
        files:
          src: [
            "<%= yeoman.dist %>/scripts/{,*/}*.js", 
            "<%= yeoman.dist %>/styles/{,*/}*.css", 
            "<%= yeoman.dist %>/images/{,*/}*.{png,jpg,jpeg,gif,webp,svg}", 
            "<%= yeoman.dist %>/styles/fonts/*"
          ]

    useminPrepare:
      html: "<%= yeoman.app %>/index.html"
      options:
        dest: "<%= yeoman.dist %>"

    usemin:
      html: ["<%= yeoman.dist %>/{,*/}*.html"]
      css: ["<%= yeoman.dist %>/styles/{,*/}*.css"]
      options:
        dirs: ["<%= yeoman.dist %>"]

    imagemin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.{png,jpg,jpeg}"
          dest: "<%= yeoman.dist %>/images"
        ]

    svgmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.app %>/images"
          src: "{,*/}*.svg"
          dest: "<%= yeoman.dist %>/images"
        ]

    cssmin: {}
    
    # By default, your `index.html` <!-- Usemin Block --> will take care of
    # minification. This option is pre-configured if you do not wish to use
    # Usemin blocks.
    # dist: {
    #   files: {
    #     '<%= yeoman.dist %>/styles/main.css': [
    #       '.tmp/styles/{,*/}*.css',
    #       '<%= yeoman.app %>/styles/{,*/}*.css'
    #     ]
    #   }
    # }
    htmlmin:
      dist:
        options: {}
        
        #removeCommentsFromCDATA: true,
        #					 // https://github.com/yeoman/grunt-usemin/issues/44
        #					 //collapseWhitespace: true,
        #					 collapseBooleanAttributes: true,
        #					 removeAttributeQuotes: true,
        #					 removeRedundantAttributes: true,
        #					 useShortDoctype: true,
        #					 removeEmptyAttributes: true,
        #					 removeOptionalTags: true
        files: [
          expand: true
          cwd: "<%= yeoman.app %>"
          src: ["*.html", "views/*.html"]
          dest: "<%= yeoman.dist %>"
        ]

    
    # Put files not handled in other tasks here
    copy:
      dist:
        files: [
          expand: true
          dot: true
          cwd: "<%= yeoman.app %>"
          dest: "<%= yeoman.dist %>"
          src: ["*.{ico,png,txt}", ".htaccess", "bower_components/**/*", "images/{,*/}*.{gif,webp}", "styles/fonts/*"]
        ,
          expand: true
          cwd: ".tmp/images"
          dest: "<%= yeoman.dist %>/images"
          src: ["generated/*"]
        ]

      styles:
        expand: true
        cwd: "<%= yeoman.app %>/styles"
        dest: ".tmp/styles/"
        src: "{,*/}*.css"

    concurrent:
      server: ["coffee:dist", "copy:styles"]
      test: ["coffee", "copy:styles"]
      dist: ["coffee", "copy:styles", "imagemin", "svgmin", "htmlmin"]

    karma:
      unit:
        configFile: "karma.conf.js"
        singleRun: true

    cdnify:
      dist:
        html: ["<%= yeoman.dist %>/*.html"]

    ngmin:
      dist:
        files: [
          expand: true
          cwd: "<%= yeoman.dist %>/scripts"
          src: "*.js"
          dest: "<%= yeoman.dist %>/scripts"
        ]

    uglify:
      dist:
        files:
          "<%= yeoman.dist %>/scripts/scripts.js": ["<%= yeoman.dist %>/scripts/scripts.js"]

    ngdocs:
      options:
        dest: "docs"
        scripts: ["../app.min.js"]
        html5Mode: true
        startPage: "/api"
        title: "My Awesome Docs"
        
        #image : "path/to/my/image.png",
        imageLink: "http://my-domain.com"
        titleLink: "/api"
        bestMatch: true
        analytics:
          account: "UA-08150815-0"
          domainName: "my-domain.com"

        discussions:
          shortName: "my"
          url: "http://my-domain.com"
          dev: false

      tutorial:
        src: ["content/tutorial/*.ngdoc"]
        title: "Tutorial"

      api:
        src: ["<%= yeoman.app %>/scripts/**/*.js", "!test/**/*.spec.js"]
        title: "API Documentation"
        
    jasmine:
      test:
        src: ['<%= yeoman.app %>/scripts/**/*.js', '.tmp/scripts/**/*.js']
        options:
          vendor: [ 
            'app/bower_components/jquery/jquery.js'
            'app/bower_components/angular/angular.js'
            'app/bower_components/angular-scenario/angular-scenario.js'
            'app/bower_components/angular-mocks/angular-mocks.js'
          ]
          keepRunner: true
          specs: ['test/spec/**/*.js', '.tmp/spec/**/*.js']

  grunt.loadNpmTasks "grunt-karma"
  grunt.registerTask "server", (target) ->
    return grunt.task.run(["build", "connect:dist:keepalive"])  if target is "dist"
    grunt.task.run ["clean:server", "concurrent:server", "autoprefixer", "connect:livereload", "watch"]

  grunt.registerTask "test", ["clean:server", "concurrent:test", "autoprefixer", "connect:test", "karma"]
  grunt.registerTask "build", ["clean:dist", "useminPrepare", "concurrent:dist", "autoprefixer", "concat", "copy:dist", "cdnify", "ngmin", "cssmin", "uglify", "rev", "usemin"]
  grunt.registerTask "default", ["test", "build"]