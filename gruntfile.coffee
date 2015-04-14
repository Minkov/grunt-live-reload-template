module.exports = (grunt) =>
	require('load-grunt-tasks')(grunt);
	port = 9000 + ((Math.random() * 10) | 0)
	grunt.initConfig
		appSettings:
			port: port
		connect:
			server:
				options:
					livereload: true
					base: 'app/'
					port: '<%= appSettings.port %>'
		open:
			server:
				path: 'http://localhost:<%= appSettings.port %>'
				app: 'chrome.exe'
		watch:
			options:
				livereload: true
			html:
				files: 'app/**/*.html'
			css: 
				files: 'app/**/*.css'
			scripts:
				files: 'app/**/*.js'
	grunt.registerTask 'serve', ['connect', 'open', 'watch']
	grunt.registerTask 'default', ['serve']
