{Collections, Models, Routes, Views} = App

Views.ItemView = class ItemView extends Backbone.View

  tagName: 'li'

  initialize: ->
    _.bindAll @
    @model.on 'change', @render
    @model.on 'remove', @unrender

  render: ->
    @$el.html JST['item_view'].render(@model.toJSON())
    @

  events:
    'click .swap': 'swap'
    'click .delete': 'remove'

  remove: -> @model.destroy()

  swap: ->
    @model.set
      part1: @model.get 'part2'
      part2: @model.get 'part1'

  unrender: -> @$el.remove()
