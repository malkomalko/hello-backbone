window.App.Views.ListView =
class ListView extends Backbone.View

  initialize: ->
    _.bindAll @
    @counter = 0
    @render()

  render: ->
    @$el.append '<button id="add">Add List Item</button>'
    @$el.append '<ul></ul>'

  el: $('.container')

  events:
    'click button#add': 'addItem'

  addItem: ->
    @counter++
    $('ul', @el).append "<li>Hello, Backbone #{@counter}!</li>"
