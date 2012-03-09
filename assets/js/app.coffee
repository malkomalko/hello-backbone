#= require _init
#= require libs/jquery-1.7.1.min.js
#= require libs/json2.js
#= require libs/underscore-min.js
#= require libs/backbone-min.js
#= require libs/bootstrap.min.js
#= require_tree models
#= require_tree collections
#= require_tree routes
#= require_tree views

{ Collections, Models, Routes, Views } = App

jQuery ->

  Backbone.sync = (method, model, success, error) ->
    success()

  list_view = new Views.ListView
