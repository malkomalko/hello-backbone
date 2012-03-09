{ Collections, Models, Routes, Views } = App

Collections.List = class List extends Backbone.Collection

  model: Models.Item

  url: '/todos'
