{ Collections, Models, Routes, Views } = App

Routes.Application = class Application extends Backbone.Router

  routes:
    '': 'index'
    '/': 'index'
    '*actions': 'default'

  index: ->
    list_view = new Views.ListView

  default: (actions) ->
