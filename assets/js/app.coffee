#= require _init
#= require libs/jquery-1.7.1.min.js
#= require libs/json2.js
#= require libs/underscore-min.js
#= require libs/backbone-min.js
#= require_tree models
#= require_tree collections
#= require_tree routes
#= require_tree views

jQuery ->

   list_view = new window.App.Views.ListView
