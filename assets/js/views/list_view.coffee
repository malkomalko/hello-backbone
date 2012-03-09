{ Collections, Models, Routes, Views } = App

Views.ListView = class ListView extends Backbone.View

  el: $('#app')

  initialize: ->
    _.bindAll @
    @counter = 0
    @collection = new Collections.List
    @collection.on 'add', @appendItem
    @collection.on 'reset', @appendItems
    @collection.fetch()
    @render()

  render: -> @$el.html JST['list_view'].render({})

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

  appendItems: (collection) ->
    @collection.each (item) => @appendItem(item)
    @counter += @collection.length
