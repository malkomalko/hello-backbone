var app = module.parent.exports
  , routes = module.exports = {};

routes.index = function(req, res){
  var todos = [
    {_id:'todoId1', part1: 'Hello Backbone', part2: '1'},
    {_id:'todoId2', part1: 'Hello Backbone', part2: '2'},
    {_id:'todoId3', part1: 'Hello Backbone', part2: '3'}
  ]
  res.json(todos);
};

routes.delete = function(req, res){
  res.json({msg: 'Todo deleted!'});
};

app.get('/todos', routes.index);
app.del('/todos/:todoId', routes.delete);
