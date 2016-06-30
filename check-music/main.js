// Generated by CoffeeScript 1.10.0
(function() {
  var errorCount, start, stop;

  errorCount = 0;

  start = function() {
    $('.stop').removeClass('disabled');
    $('.start').addClass('disabled');
    return co(function*() {
      var albumMsg, i, j, k, l, mesg, trackMsg;
      for (i = k = 1; k <= 3; i = ++k) {
        albumMsg = "Album " + i;
        phigh(albumMsg);
        for (j = l = 1; l <= 10; j = ++l) {
          if (i === 2 && j === 3 || i === 3 && j === 7) {
            trackMsg = "Track " + j + " - something blew up";
            perr(trackMsg);
            errorCount += 1;
            $('.show-errors').show().text("Show errors (" + errorCount + ")");
            $('<li>').text(albumMsg + ": " + trackMsg).appendTo('.errors');
            playSound('error');
          } else {
            pinfo("Track " + j);
          }
          (yield sleep(0.3));
        }
      }
      mesg = 'Encountered 2 errors';
      perr(mesg);
      (yield playSound('failure'));
      (yield speak(mesg));
      return stop();
    });
  };

  stop = function(manual) {
    $('.stop').addClass('disabled');
    return $('.start').removeClass('disabled');
  };

  start();

}).call(this);