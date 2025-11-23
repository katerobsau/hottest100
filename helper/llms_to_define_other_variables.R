library(ellmer)
library(glue)
library(tidyverse)

data(hottest100_tracks)

# Step 1: Turn the track data into a list of strings (glued)
# and add the prompt to the end of the glue string

artist_prompt_list = hottest100_tracks |>
  mutate(
    prompt_str = glue(
      "For {artist} | {track} | {releaseyear} - what type of artist is this band/solo/other, what is the artist gender and are they an indigenous australia"
    )
  ) |>
  pull(prompt_str) |>
  as.list()

track_prompt_list = hottest100_tracks |>
  mutate(
    prompt_str = glue(
      "For {artist} | {track} | {releaseyear} - what is the genre of this song and is it a cover"
    )
  ) |>
  pull(prompt_str) |>
  as.list()

# Step 2: Set up the type objects for parallel query using ellmer

type_artist <- type_object(
  artist_name = type_string(),
  year_ref = type_integer(),
  artist_type = type_string(),
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
  # aggressively_australian = type_boolean()
)

## Step 3: Set up parallel_chat_structured

chat_description = "You are an research assistant helping me analyse data from
the Australian music industry. You are specifically interested in the Triple J
hottest 100 countdown. You are very careful to return NA when you are not sure of a
given variable"

music_chat <- ellmer::chat_anthropic(chat_description)

## Step 4: Establish some test cases for expected augmented outcomes

# Some test cases:

ind_head = 1:5 # Interesting shows male/Male
set.seed(1)
ind_random = sample(1:length(prompt_list), 10) #random sample
ind_test_indigneous = c(3117, 3309, 2021) # Various identities
ind_test_gender = c(3024, 3836, 3673, 2711, 1, 430) # Various genders

test_head = parallel_chat_structured(
  music_chat,
  artist_prompt_list[ind_head],
  type_artist
)

test_random = parallel_chat_structured(
  music_chat,
  artist_prompt_list[ind_random],
  type_artist
)

test_indigneous_artists = parallel_chat_structured(
  music_chat,
  artist_prompt_list[ind_test_indigneous],
  type_artist
)

# this returned NA/no for indigenous Australian for the same band
test_gender = parallel_chat_structured(
  music_chat,
  artist_prompt_list[ind_test_gender],
  type_artist
)

## Step 5: Generate augmented data

### This took too long and is more expensive than it needs to be.
### It also needs to be batched properly and stored.

# augemented_artist_data = NULL
# i = 1
# while(i < num_countdowns){
#
#   print(paste("Countdown", i))
#
#   time1 = Sys.time()
#   query_return = parallel_chat_structured(music_chat,
#                                         artist_prompt_list[((i-1)*10 + 1) : (i*10)],
#                                         type_artist)
#   time2 = Sys.time()
#   print(time2 - time1)
#   augemented_artist_data = c(augemented_artist_data, query_return)
#
#   i = i + 1
#
# }

### Step 5 alternative

# Uses much fewer tokens - but its gotten Something for Kate wrong
# And worse it only returned about half as many artists as it should have
# Still needs to be done in batches

artist_data = hottest100_artists |> select(artist, country) |> distinct()

music_chat$register_tool(ellmer::tool(
  function() artist_data,
  "Is a data set of artists, country",
  .name = "music_data"
))

classify_artist_gender_raw <- music_chat$chat(
  "Using artist_data can you classify the artists as female, male, female members, male members, mixed members, other or unknown. Return a list with the artist and assigned classification. Nothing else."
)

classify_artist_gender <- classify_artist_gender_raw |>
  strsplit("\n") |>
  as.data.frame()
names(classify_artist_gender) = "artist_gender"

classify_artist_gender_df = classify_artist_gender |>
  separate(artist_gender, sep = " - ", into = c("artist", "gender"))


classify_artist_type <- music_chat$chat(
  "Using artist_data can you classify the artists as solo, band, DJ/produced. Return a list with the artist and assigned classification. Nothing else."
)
