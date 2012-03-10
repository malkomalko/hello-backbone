/**
 * Module dependencies.
 */

var fs = require('fs')
  , path = require('path')
  , express = require('express')
  , app = module.exports = express.createServer()
  , mongoose = app.mongoose = require('mongoose');

/**
 * Globals.
 */

global.inspect = require('eyes').inspector({maxLength: 100000});

/**
 * Configuration.
 */

app.configure(function(){
  app.set('views', __dirname + '/views');
  app.set('view engine', 'jade');
  app.use(express.bodyParser());
  app.use(express.methodOverride());
  app.use(app.router);
  app.use(require('connect-assets')({build: false}));
  app.use(express.static(__dirname + '/public'));
});

app.configure('development', function(){
  app.use(express.errorHandler({dumpExceptions: true, showStack: true}));
});

app.configure('production', function(){
  app.use(express.errorHandler());
});

mongoose.connect('mongodb://localhost/hello-backbone');

/**
 * Models.
 */

fs.readdirSync(__dirname + '/lib/models').map(function(file){
  var model = path.basename(file, '.js');
  if (path.extname(file) !== ''){
    global[model] = require(__dirname + '/lib/models/' + model);
  }
});


/**
 * Routes.
 */

fs.readdirSync(__dirname + '/lib/routes').map(function(file){
  var route = path.basename(file, '.js');
  if (path.extname(file) !== ''){
    require(__dirname + '/lib/routes/' + route);
  }
});

/**
 * Start server.
 */

app.listen(10000);
