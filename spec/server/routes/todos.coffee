express = require 'express'
module.exports = express.createServer()
routes = require 'routes/todos'

describe 'todo routes', ->

  describe 'index', ->

    it 'returns 3 todo items', ->
      req = null
      res =
        json: (todos) ->
          expect(todos).to.have.length 3
      routes.index(req, res)

  describe 'delete', ->

    it 'returns a dummy message', ->
      req = null
      res =
        json: (json) ->
          expect(json.msg).to.equal 'Todo deleted!'
      routes.delete(req, res)
