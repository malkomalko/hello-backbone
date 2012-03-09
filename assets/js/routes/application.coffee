{ Collections, Models, Routes, Views } = App

Routes.Application = class Application extends Backbone.Router

  routes:
    "*actions": "default"

  default: (actions) ->
    console.log "Hello default router w/ actions: #{actions}"
