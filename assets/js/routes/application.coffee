{ Collections, Models, Routes, Views } = App

Routes.Application = class Application extends Backbone.Router

  routes:
    "*actions": "default"

  default: (actions) ->
