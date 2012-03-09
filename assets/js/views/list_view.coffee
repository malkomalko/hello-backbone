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
    @$el.append '<a class="btn btn-large btn-primary" id="add">Add List Item</a>'
    @$el.append '<ul></ul>'
    @collection.each (item) => @appendItem(item)

  el: $('#app')

  events:
    'click a#add': 'addItem'

  addItem: ->
    @counter++
    item = new Models.Item
    item.set part2: "#{item.get 'part2'} #{@counter}"
    @collection.add item

  appendItem: (item) ->
    item_view = new Views.ItemView model: item
    $('ul', @el).append item_view.render().el
