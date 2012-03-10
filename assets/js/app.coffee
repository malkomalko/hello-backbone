#= require _init
#= require libs/jquery-1.7.1.min.js
#= require libs/json2.js
#= require libs/underscore-min.js
#= require libs/backbone-min.js
#= require libs/backbone.layoutmanager.min.js
#= require libs/bootstrap.min.js
#= require libs/hogan-1.0.5.min.js
#= require_tree compiled_templates
#= require_tree models
#= require_tree collections
#= require_tree routes
#= require_tree views

{Collections, Models, Routes, Views} = App

jQuery ->

  App.router = new Routes.Application
  Backbone.history.start pushState: false, root: '/', silent: false
