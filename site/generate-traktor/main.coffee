running = null
completed = false
total = 1000

start = () ->
  running = true

  $('.stop').removeClass('disabled')
  $('.start').addClass('disabled')
  co(() ->
    for i in [1..total]
      if running
        percent = i / total * 100
        $('.percent').text("#{percent.toFixed(0)}%")
        $('progress').val(percent)
        pinfo "Track #{i}"
        yield sleep 0.005
      else
        return

    mesg = 'Generated NML file containing 1000 tracks'
    psuccess mesg
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
