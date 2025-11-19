type_countdown_info <- type_object(
  countdown_type = type_string(),
  artist_name = type_string(),
  artist_country = type_string(),
  song_id = type_integer(),
  pollyear = type_integer(),
  position = type_integer(),
  release_year = type_integer(),
  track = type_string()
)

type_artist <- type_object(
  artist_name = type_string(),
  year_ref = type_integer(),
  artist_gender = type_string(),
  artist_country = type_string(),
  indigenous_australian = type_string()
)

type_track <- type_object(
  artist_name = type_string(),
  track = type_string(),
  release_year = type_integer(),
  track_genre = type_string(),
  track_cover = type_boolean(),
  artist_gender = type_string(),
  aggressively_australian = type_boolean()
)
