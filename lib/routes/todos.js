var app = module.parent.exports;

app.get('/todos', function(req, res) {
  var todos = [
    { _id:'todoId1', part1: 'Hello Backbone', part2: '1' },
    { _id:'todoId2', part1: 'Hello Backbone', part2: '2' },
    { _id:'todoId3', part1: 'Hello Backbone', part2: '3' }
  ]
  res.json(todos);
});

app.del('/todos/:todoId', function(req, res) {
  res.json({ msg: 'Todo deleted!' });
});
