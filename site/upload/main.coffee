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

    mesg = 'Successfully uploaded metadata for 30 tracks'
    psuccess mesg
    yield playSound 'success'
    yield speak mesg
    stop()
  )


stop = (manual) ->
  $('.stop').addClass('disabled')
  $('.start').removeClass('disabled')


start()
