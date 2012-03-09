{ Collections, Models, Routes, Views } = App

Views.ListView = class ListView extends Backbone.View

  initialize: ->
    _.bindAll @
    @counter = 0
    @collection = new Collections.List
    @collection.on 'add', @appendItem
    _(5).times => @addItem()
    @render()

  render: ->
    @$el.append '<button id="add">Add List Item</button>'
    @$el.append '<ul></ul>'
    @collection.each (item) => @appendItem(item)

  el: $('.container')

  events:
    'click button#add': 'addItem'

  addItem: ->
    @counter++
    item = new Models.Item
    item.set part2: "#{item.get 'part2'} #{@counter}"
    @collection.add item

  appendItem: (item) ->
    $('ul', @el).append "<li>#{item.get 'part1'} #{item.get 'part2'}!</li>"
