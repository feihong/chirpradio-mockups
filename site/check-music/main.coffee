running = null
completed = false


start = () ->
  running = true
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..3]
      if running
        phigh "Album #{i}"
        yield sleep 0.3
      else
        return

    mesg = 'Encountered 2 errors!'
    perr mesg
    speak mesg
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
