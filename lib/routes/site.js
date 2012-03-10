var app = module.parent.exports
  , routes = module.exports = {};

routes.index = function(req, res){
  res.render('index');
};

routes.testRunner = function(req, res){
  res.render('test_runner', { layout: false });
};

app.get('/', routes.index);
app.get('/test_runner', routes.testRunner);
