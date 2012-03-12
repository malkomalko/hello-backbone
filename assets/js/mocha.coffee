#= require _init
#= require libs/jquery-1.7.1.min.js
#= require libs/mocha.js
#= require libs/chai.js
#= require libs/sinon.js
#= require libs/sinon-chai.js
#= require libs/sinon-mocha.js

window.chai.use window.sinonChai
window.SinonMocha.enhance window.sinon
window.expect = window.chai.expect
window.mocha.setup 'bdd'

window.mocha.Runner.prototype.checkGlobals = ->

jQuery ->

  window.mocha.run()

