express = require 'express'
module.exports = express.createServer()
routes = require 'routes/site'

describe 'site routes', ->

  [req, res] = [{}, {}]

  describe 'index', ->

    it 'renders the index template', ->
      res.render = (view) ->
        expect(view).to.equal 'index'
      routes.index(req, res)
