#' Compute market share in an airport or city
#'
#' Compute market share in an airport or city, with flexibility to specify how the 
#' carrier is defined
#' 
#' @param dataframe Dataset to be based market share off of, should have a Passengers column
#' @param carrier Column name containing carrier name of each ticket, unquoted
#' @param location Column name containing the origination, unquoted
#' 
#' @returns a dataframe with the carrier and orig columns and a market_share 
#' column that contains the market share of that carrier in that location,
#' as a proportion.
#' 
#' @examplesIf require("tibble")
#' require("tibble")
#' data = tibble::tribble(
#'      ~origin, ~airline, ~Passengers,
#'      "CLT", "American," 10,
#'      "RDU","American", 5,
#'      "RDU", "United", 7
#' )
#'
#' market_shares(data, airline, carrier)
#' 

#' @export
mktshares <- function(dataframe, carrier, location){
  mkt_shares = dataframe |>
    group_by({{carrier}}, {{location}}) |>
    summarize(Passengers = sum(Passengers)) |>
    group_by({{location}}) |>
    mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
    ungroup()

  mkt_shares |> arrange(-market_share)
  # filter(mkt_shares, total_passengers > 1000) |> arrange(-market_share)

} 