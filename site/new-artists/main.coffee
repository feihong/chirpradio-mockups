running = true


$('button.stop').on 'click', () ->
  running = false
  co(() ->
    plog 'Stopping...'
    yield sleep 1
    plog 'Stopped!'
  )


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
)
