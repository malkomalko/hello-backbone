{ Collections, Models, Routes, Views } = App

Views.ItemView = class ItemView extends Backbone.View

  initialize: ->
    _.bindAll @
    @model.bind 'change', @render
    @model.bind 'remove', @unrender

  render: ->
    @$el.html """
      <span>#{@model.get 'part1'} #{@model.get 'part2'}!</span>
      <span class="swap label label-info">swap</span>
      <span class="delete label label-important">delete</span>
    """
    @

  tagName: 'li'

  events:
    'click .swap': 'swap'
    'click .delete': 'remove'

  remove: -> @model.destroy()

  swap: ->
    @model.set
      part1: @model.get 'part2'
      part2: @model.get 'part1'

  unrender: => @$el.remove()
