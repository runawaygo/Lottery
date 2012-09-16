seajs.config({
	base: '/client/',
	debug:true,
	alias: {
		'coffee': 'lib/coffee-script',
    	'less': 'lib/less',
		'json':'lib/json2',
	    'jquery': 'lib/jquery-1.6.2.min',
		'jquery-ui':'lib/jquery-ui-1.8.16.custom.min',
	    'backbone': 'lib/backbone',
	    'underscore': 'lib/underscore-1.1.6',
		'jquery-tmpl':'lib/jquery.tmpl',
		'bootstrap-modal':'lib/bootstrap/bootstrap-modal.js',
		'bootstrap-twipsy':'lib/bootstrap/bootstrap-twipsy.js'
  },
  preload: ['plugin-coffee', 'plugin-less']
});

define(function(require) {
	console.log('begin');
	require('css/index.less');
	require('index.coffee');	
});
