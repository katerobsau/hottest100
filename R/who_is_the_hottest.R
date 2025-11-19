who_is_the_hottest <- function(year, special = NULL){

  year_range = hottest100_tracks$pollyear |> range()

  if(year < min(year_range) | year > max(year_range) |
     (year == 1989 & is.null(special))){
    stop("Sorry that countdown isn't in this dataset")
  }

  if(is.null(special)){

    countdown_winner = hottest100_tracks |>
      filter(pollyear == year & position == 1 & alltime == FALSE)

    output_str = glue("In {year}, {countdown_winner$artist} was the hottest!")

    print(output_str)

  }else{

    countdown_winner = hottest100_tracks |>
      filter(pollyear == year & position == 1 & alltime == TRUE)

    output_str = glue("For the special countdown in {year} - {countdown_winner$artist} was the hottest!")

    print(output_str)

  }

  return(countdown_winner)

}
