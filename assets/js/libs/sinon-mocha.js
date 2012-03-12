var WrapMethod = {};
WrapMethod.enhance = function(sinon){
  var wrap = sinon.wrapMethod;
  WrapMethod.sinonInstance = sinon;
  WrapMethod.originalWrapMethod = wrap;
  sinon.wrapMethod = WrapMethod.wrapMethod;
};
WrapMethod.wrapMethod = function(){
  var result = WrapMethod.originalWrapMethod.apply(this, arguments);
  WrapMethod.objects.push(result);
  return result;
};
WrapMethod.wrapMethod.restore = function(){
  WrapMethod.sinonInstance.wrapMethod = WrapMethod.originalWrapMethod;
};
WrapMethod.restoreWrappedMethods = function(){
  var i = 0, len = WrapMethod.objects.length, obj;
  for(i, len; i < len; i++){
    obj = WrapMethod.objects[i];
    if(obj.restore){
      obj.restore();
    }
  }
  WrapMethod.objects.length = 0;
};
WrapMethod.objects = [];

var Hooks;
Hooks = {
  _beforeEaches: [],
  _afterEaches: [],
  _enhanced: false,
  enhance: function(mocha){
    var runSuite;
    if(typeof(mocha) === 'undefined'){
      mocha = window.mocha;
    }
    runSuite = mocha.Runner.prototype.runSuite;
    mocha.Runner.prototype.runSuite = function(suite){
      var beforeEachHook;
      if(suite.title === '' && !Hooks._enhanced){
        beforeEachHook = new mocha.Hook('"before each" hook', function(){
          Hooks.runBeforeEach(this);
        });
        suite.afterEach(function(){
          Hooks.runAfterEach(this);
        });
        beforeEachHook.parent = suite;
        beforeEachHook.ctx = suite.ctx;
        beforeEachHook.timeout(suite.timeout());
        suite._beforeEach.unshift(beforeEachHook);
        Hooks._enhanced = true;
      }
      return runSuite.apply(this, arguments);
    };
  },
  beforeEach: function(fn){
    this._beforeEaches.push(fn);
  },
  afterEach: function(fn){
    this._afterEaches.push(fn);
  },
  _runHooksFor: function(type, context){
    var i = 0,
        store = Hooks[type],
        len = store.length;
    for(i = 0; i < len; i++){
      store[i].call(context);
    }
  },
  runBeforeEach: function(context){
    Hooks._runHooksFor('_beforeEaches', context);
  },
  runAfterEach: function(context){
    Hooks._runHooksFor('_afterEaches', context);
  }
};

var SinonMocha;
SinonMocha = {
  sinon: null,
  enhance: function(sinon, mocha){
    SinonMocha.sinon = sinon;
    Hooks.enhance(mocha);
    Hooks.beforeEach(SinonMocha.beforeEach);
    Hooks.afterEach(SinonMocha.afterEach);
  },
  beforeEach: function(){
    WrapMethod.enhance(SinonMocha.sinon);
  },
  afterEach: function(){
    WrapMethod.restoreWrappedMethods();
    sinon.wrapMethod.restore();
  }
};

window.SinonMocha = SinonMocha;
