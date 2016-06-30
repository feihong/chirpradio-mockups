errorCount = 0

start = () ->
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
          errorCount += 1
          $('.show-errors').show().text("Show errors (#{errorCount})")
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
  $('.stop').addClass('disabled')
  $('.start').removeClass('disabled')


start()
