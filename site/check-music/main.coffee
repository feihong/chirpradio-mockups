running = null
completed = false


start = () ->
  running = true
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..3]
      albumMsg = "Album #{i}"
      phigh albumMsg
      for j in [1..10]
        if i == 2 and j == 3 or i == 3 and j == 7
          trackMsg = "Track #{j} - something blew up"
          perr trackMsg
          $('.error-container').show()
          $('<li>').text("#{albumMsg}: #{trackMsg}").appendTo('.errors')
          playSound 'error'
        else
          pinfo "Track #{j}"
        yield sleep 0.3

    mesg = 'Encountered 2 errors'
    perr mesg
    yield playSound 'failure'
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
