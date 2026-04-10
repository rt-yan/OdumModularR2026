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