start = () ->
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..3]
      albumMsg = "Album #{i}"
      phigh albumMsg
      for j in [1..10]
          pinfo "Track #{j}"
          yield sleep 0.2

    mesg = 'Successfully imported 30 tracks'
    phigh mesg
    yield playSound 'success'
    yield speak mesg
    stop()
  )


stop = (manual) ->
  $('.stop').addClass('disabled')
  $('.start').removeClass('disabled')
  $('.next').removeClass('disabled')


start()
