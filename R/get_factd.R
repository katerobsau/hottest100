#' Get the facts
#'
#' This function will help searching for information
#'
#' @export
#' @examples
#' get_factd()
get_factd <- function() {
  num_facts <- 6
  factd <- sample(1:num_facts, 1)

  # Who has the most entries ever
  if (factd == 1) {
    most_entries <- tracks |>
      dplyr::group_by(artist) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{most_entries$artist} has the most entries ever in any countdown.
                      They have appeared {most_entries$n} times!"
    )
  }

  # Who has the most entries in regular countdowns ever
  if (factd == 2) {
    most_entries_reg <- tracks |>
      dplyr::filter(alltime == FALSE) |>
      dplyr::group_by(artist) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{most_entries_reg$artist} has the most entries ever in the hottest \\
      100 yearly countdown. They have appeared {most_entries_reg$n} times!"
    )
  }

  # Who has the most entries in the top 10 ever
  if (factd == 3) {
    most_entries_top10 <- tracks |>
      dplyr::filter(position <= 10) |>
      dplyr::group_by(artist) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{most_entries_top10$artist} has the most top 10 entries. \\
      They have appeared {most_entries_top10$n} times across all countdowns!"
    )
  }

  # Who has the most entries in the top 10 regular countdowns ever
  if (factd == 4) {
    most_entries_top10_reg <- tracks |>
      dplyr::filter(position <= 10 & alltime == FALSE) |>
      dplyr::group_by(artist) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{most_entries_top10_reg$artist} has the most top 10 entries in the \\
      yearly countdowns. They have appeared {most_entries_top10_reg$n} times!"
    )
  }

  # Who has appeared in the most number of countdowns
  if (factd == 5) {
    num_countdowns <- tracks |>
      dplyr::group_by(artist, pollyear, alltime) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{num_countdowns$artist} has appeared in largest number of past \\
      countdowns. They have made appearances in {num_countdowns$n} \\
      different countdowns!"
    )
  }

  # Who has appeared in the most number of reg countdowns
  if (factd == 6) {
    num_countdowns_reg <- tracks |>
      dplyr::filter(alltime == FALSE) |>
      dplyr::group_by(artist, pollyear) |>
      dplyr::count() |>
      dplyr::ungroup() |>
      dplyr::filter(n == max(n))

    output_str <- glue::glue(
      "{num_countdowns_reg$artist} has appeared in {num_countdowns_reg$n} \\
      yearly countdowns. "
    ) |>
      glue::glue_collapse() |>
      paste("That's higher than any other artist")
  }

  print(output_str)
}
