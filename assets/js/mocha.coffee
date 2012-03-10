#= require _init
#= require libs/jquery-1.7.1.min.js
#= require libs/mocha.js
#= require libs/chai.js
#= require libs/sinon.js
#= require libs/sinon-chai.js

window.chai.use window.sinonChai
window.chai.expect()
window.mocha.setup 'bdd'

jQuery ->

  window.mocha.run().globals(['App'])

