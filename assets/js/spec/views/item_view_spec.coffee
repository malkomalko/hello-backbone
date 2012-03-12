describe 'ItemView', ->

  describe 'el', ->

    it 'returns a value', ->
      view = new App.Views.ItemView model: new App.Models.Item
      expect(view.el).to.exist

