window.App.Views.ListView =
class ListView extends Backbone.View

  el: $('body')

  initialize: ->
    _.bindAll @
    @render()

  render: ->
    @$el.append '<ul><li>Hello, Backbone!</li></ul>'
