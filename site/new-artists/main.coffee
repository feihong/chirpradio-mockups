running = null
completed = false


start = () ->
  running = true
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..30]
      if running
        plog "Artist #{i}"
        yield sleep 0.3
      else
        return

    mesg = 'Found 30 new artists!'
    completed = true
    plog mesg
    speak mesg
    stop()
  )


stop = (manual) ->
  running = false

  co(() ->
    if manual
      plog 'Stopping...'
      yield sleep 1
      plog 'Stopped!'
    $('.stop').addClass('disabled')
    $('.start').removeClass('disabled')
    if completed
      $('.next').removeClass('disabled')
  )


$('.start').on 'click', () ->
  if not running
    start()


$('.stop').on 'click', () ->
  if running
    stop(true)


start()
