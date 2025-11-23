#' Find the best in any year
#'
#' This function will help searching for information by year
#'
#' @param year integer, pollyear to search in `tracks` data.
#' @param special logical, whether to include `alltime` in the data. Default is
#'   to not include this.
#'
#' @export
#' @examples
#' who_is_the_hottest(2023)
who_is_the_hottest <- function(year, special = NULL){

  year_range = tracks$pollyear |> range()

  if(year < min(year_range) | year > max(year_range))
    stop("Sorry that countdown isn't in this dataset.")

  if(is.null(special)){

    countdown_winner = tracks |>
      dplyr::filter(pollyear == year & position == 1 & alltime == FALSE)

    if(nrow(countdown_winner) == 0)
      stop("Sorry that countdown isn't in this dataset.")

    output_str = glue::glue("In {year}, {countdown_winner$artist} was the hottest!")

  }else{

    countdown_winner = tracks |>
      dplyr::filter(pollyear == year & position == 1 & alltime == TRUE)

    output_str = glue::glue("For the special countdown in {year} - {countdown_winner$artist} was the hottest!")

  }

  print(output_str)

  invisible(NULL)

}
