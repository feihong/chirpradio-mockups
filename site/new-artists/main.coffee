running = null
completed = false


start = () ->
  running = true
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..30]
      if running
        pinfo "Artist #{i}"
        yield sleep 0.2
      else
        return

    mesg = 'Found 30 new artists!'
    completed = true
    phigh mesg
    yield playSound 'success'
    yield speak mesg
    stop()
  )


stop = (manual) ->
  running = false

  co(() ->
    if manual
      pinfo 'Stopping...'
      yield sleep 1
      pinfo 'Stopped!'
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
