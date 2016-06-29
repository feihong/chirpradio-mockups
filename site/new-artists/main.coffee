running = null


start = () ->
  running = true
  $('button.stop').removeClass('disabled')
  $('button.start').addClass('disabled')
  co(() ->
    for i in [1..30]
      if running
        plog "Artist #{i}"
        yield sleep 0.3
      else
        return

    mesg = 'Found 30 new artists!'
    plog mesg
    speak mesg
    stop()
  )

stop = () ->
  running = false

  co(() ->
    plog 'Stopping...'
    yield sleep 1
    plog 'Stopped!'
    $('button.stop').addClass('disabled')
    $('button.start').removeClass('disabled')
  )




$('button.start').on 'click', () ->
  if not running
    start()


$('button.stop').on 'click', () ->
  if running
    stop()


start()
