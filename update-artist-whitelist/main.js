// Generated by CoffeeScript 1.10.0
(function() {
  var completed, running, start, stop;

  running = null;

  completed = false;

  start = function() {
    running = true;
    $('.stop').removeClass('disabled');
    $('.start').addClass('disabled');
    return co(function*() {
      var i, j, mesg;
      for (i = j = 1; j <= 10; i = ++j) {
        if (running) {
          pinfo("Artist " + i);
          (yield sleep(0.3));
        } else {
          return;
        }
      }
      mesg = 'Encountered unexpected error!';
      perr(mesg);
      (yield playSound('failure'));
      (yield speak(mesg));
      return stop();
    });
  };

  stop = function(manual) {
    running = false;
    return co(function*() {
      if (manual) {
        pinfo('Stopping...');
        (yield sleep(1));
        pinfo('Stopped!');
      }
      $('.stop').addClass('disabled');
      $('.start').removeClass('disabled');
      if (completed) {
        return $('.next').removeClass('disabled');
      }
    });
  };

  $('.start').on('click', function() {
    if (!running) {
      return start();
    }
  });

  $('.stop').on('click', function() {
    if (running) {
      return stop(true);
    }
  });

  start();

}).call(this);
