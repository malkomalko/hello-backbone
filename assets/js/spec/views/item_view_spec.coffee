describe 'ItemView', ->

  before ->
    @item = new App.Models.Item
    @view = new App.Views.ItemView model: @item

  describe 'el', ->

    it 'returns a value', ->
      expect(@view.el).to.exist

