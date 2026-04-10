#' @export
busiest_routes <- function(dataframe, origcol, destcol){
  MILES_TO_KILOMETERS = 1.609
  stopifnot(all(dataframe$Passengers >=1))
  stopifnot(!any(is.na(dataframe$Passengers)))

  pairs = dataframe |>
    group_by({{ origcol }}, {{ destcol }}) |>
    summarize(Passengers = sum(Passengers), distance_km = first(Distance) * MILES_TO_KILOMETERS)
  arrange(pairs, -Passengers)
}