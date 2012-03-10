{Collections, Models, Routes, Views} = App

Models.Item = class Item extends Backbone.Model

  defaults:
    part1: 'Hello'
    part2: 'Backbone'

  idAttribute: '_id'
