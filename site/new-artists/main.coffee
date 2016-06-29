co(() ->
  for i in [1..30]
    plog "Artist #{i}"
    yield sleep 0.5
)
