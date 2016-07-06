sfx = jsfx.Sounds(window.soundEffectsLibrary)


window.sleep = (delay) ->
  return new Promise((resolve, reject) ->
    window.setTimeout(resolve, delay * 1000)
  )


window.speak = (text) ->
  if window.speechSynthesis == undefined
    return Promise.resolve()

  return new Promise((resolve, reject) ->
    utterance = new SpeechSynthesisUtterance(text)
    window.speechSynthesis.speak(utterance)
    utterance.onend = resolve
  )


window.playSound = (name) ->
  return co(() ->
    sfx[name]()
    yield sleep 1
  )


plog = (text, cls) ->
  output = $('.console')
  p = $('<p>').text(text).appendTo(output)
  if cls
    p.addClass(cls)
  # Make output scroll to the bottom.
  output.scrollTop(p.offset().top - output.offset().top + output.scrollTop())


window.pinfo = (text) ->
  plog text


window.perr = (text) ->
  plog text, 'error'


window.phigh = (text) ->
  plog text, 'highlight'


window.psuccess = (text) ->
  plog text, 'success'


window.progressDisplay = (container, max) ->
  newValue = null
  running = false
  percDiv = $(container).find('.percent')
  barDiv = $(container).find('progress')

  setValue = (val) ->
    newValue = val / max * 100

    if not running
      co(() ->
        running = true
        while newValue != null
          percDiv.text "#{newValue.toFixed(0)}%"
          barDiv.val newValue
          newValue = null
          yield sleep 0.5
        running = false
      )

  return {setValue: setValue}
