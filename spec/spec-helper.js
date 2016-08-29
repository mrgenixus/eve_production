import chai from 'chai';
global.expect = chai.expect;
global._ = require('lodash');

import sinon from 'sinon';
var sinonChai = require("sinon-chai");

chai.use(sinonChai);

beforeEach(function() {
  this.sinon = sinon.sandbox.create();
});

afterEach(function() {
  this.sinon.restore();
});

global.sinon = {
  stub: function() {
    throw new Error('call this.sinon.stub instead');
  },

  spy: function() {
    throw new Error('call this.sinon.stub instead');
  },

  useFakeXMLHttpRequest: sinon.useFakeXMLHttpRequest.bind(sinon),
  fakeServer: sinon.fakeServer
}

global.itShouldBehaveLike = {
  aReducer: function(subject) {
    context('is a reducer so', function() {
      it('is a function', function() {
        expect(subject).to.be.a('function');
      });

      it('returns state when action type is irrelevant', function() {
        let garbage = deepFreeze({ uncle: 'Bob', like: 'pizza' });
        let garbagePlus = { dislikes: 'Broccoli' };
        let invalidAction = deepFreeze({ type: 'INVALID', ...garbagePlus });
        expect(subject(garbage, invalidAction)).to.deep.equal(garbage);
      });
    });
  }
}
