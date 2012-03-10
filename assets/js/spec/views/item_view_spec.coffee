describe 'ItemView', ->

  before ->
    @view = new App.Views.ItemView

  describe 'el', ->

    it 'returns a value', ->
      expect(@view.el).to.exist()

