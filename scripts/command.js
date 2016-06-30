// Generated by CoffeeScript 1.10.0
(function() {
  var plog, sfx;

  sfx = jsfx.Sounds(window.soundEffectsLibrary);

  window.sleep = function(delay) {
    return new Promise(function(resolve, reject) {
      return window.setTimeout(resolve, delay * 1000);
    });
  };

  window.speak = function(text) {
    if (window.speechSynthesis === void 0) {
      return Promise.resolve();
    }
    return new Promise(function(resolve, reject) {
      var utterance;
      utterance = new SpeechSynthesisUtterance(text);
      window.speechSynthesis.speak(utterance);
      return utterance.onend = resolve;
    });
  };

  window.playSound = function(name) {
    return co(function*() {
      sfx[name]();
      return (yield sleep(1));
    });
  };

  plog = function(text, cls) {
    var output, p;
    output = $('.console');
    p = $('<p>').text(text).appendTo(output);
    if (cls) {
      p.addClass(cls);
    }
    return output.scrollTop(p.offset().top - output.offset().top + output.scrollTop());
  };

  window.pinfo = function(text) {
    return plog(text);
  };

  window.perr = function(text) {
    return plog(text, 'error');
  };

  window.phigh = function(text) {
    return plog(text, 'highlight');
  };

}).call(this);
