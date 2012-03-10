var app = module.parent.exports
  , routes = module.exports = {};

routes.index = function(req, res){
  res.render('index');
};

app.get('/', routes.index);
