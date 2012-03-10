express = require 'express'
module.exports = express.createServer()
routes = require 'routes/site'

describe 'site routes', ->

  describe 'index', ->

    it 'renders the index template', ->
      req = null
      res =
        render: (view) ->
          expect(view).to.equal 'index'
      routes.index(req, res)
