running = null
completed = false


start = () ->
  running = true
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..3]
      phigh "Album #{i}"
      for j in [1..10]
        if j == 3
          perr "Track #{j} - something blew up"
        else
          pinfo "Track #{j}"
        yield sleep 0.3

    mesg = 'Encountered 3 errors'
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
