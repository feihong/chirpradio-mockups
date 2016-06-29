window.sleep = (delay) ->
  return new Promise((resolve, reject) ->
    window.setTimeout(resolve, delay * 1000)
)

window.plog = (text) ->
  output = $('.console')
  p = $('<p>').text(text).appendTo(output)
  # Make output scroll to the bottom.
  output.scrollTop(p.offset().top - output.offset().top + output.scrollTop())
