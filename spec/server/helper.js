var assert = global.assert = require('assert')
  , chai = require('chai')
  , inspect = global.inspect = require('eyes').inspector({maxLength: 100000})
  , nock = global.nock = require('nock')
  , sinon = global.sinon = require('sinon')
  , sinonChai = require('sinon-chai');

require('sinon-mocha').enhance(sinon);
chai.use(sinonChai);

global.expect = chai.expect;
global.mock= sinon.mock
global.spy= sinon.spy;
global.stub = sinon.stub;
