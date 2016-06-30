start = () ->
  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..1000]
      pinfo "Track #{i}"
      yield sleep 0.005

    mesg = 'Generated NML file with 1000 tracks'
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
