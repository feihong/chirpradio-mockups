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
