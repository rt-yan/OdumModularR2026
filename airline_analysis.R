# Here, we want to look at what airports are most dominated by which airlines,
# using the same data. For simplicity, we only look at departing flights. Since
# most departing flights have a corresponding return flight, this should be fairly
# accurate.
library(testthat)
testthat::use_testthat()
library(testthat)
library(usethis)
usethis::use_testthat(edition = 3)

library(OdumModularDesignR)

library(tidyverse)
devtools::load_all()

DATA_PATH = Sys.getenv("DATA_PATH") # need to restart to get it to work

data = load_data(
  datafile = file.path(DATA_PATH, "air_sample.csv"),
  cityfile = file.path(DATA_PATH, "L_CITY_MARKET_ID.csv"),
  carrierfile = file.path(DATA_PATH, "L_CARRIERS.csv")
)


# # Now, we can compute the market shares



# mktshares <- function(dataframe, carrier, location){
#   mkt_shares = dataframe |>
#     group_by({{carrier}}, {{location}}) |>
#     summarize(Passengers = sum(Passengers)) |>
#     group_by({{location}}) |>
#     mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
#     ungroup()

#   filter(mkt_shares, total_passengers > 1000) |> arrange(-market_share)
  
# } 

mktshares(data, OperatingCarrierName, OriginCity)
mktshares(data, TicketingCarrierName, OriginCity)
mktshares(data, OperatingCarrierName, Origin)
mktshares(data, TicketingCarrierName, Origin)

devtools::check()


# mkt_shares = data |>
#   group_by(OperatingCarrierName, OriginCity) |>
#   summarize(Passengers = sum(Passengers)) |>
#   group_by(OriginCity) |>
#   mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
#   ungroup()

# filter(mkt_shares, total_passengers > 1000) |> arrange(-market_share)

# # many of the smaller airlines actually operate regional aircraft for larger carriers
# # For instance, PSA Airlines flies small aircraft for American Airlines, branded as
# # American Eagle and sold with connections to/from American Airlines flights.
# # Here, we repeat the analysis using the TicketingCarrierName instead of the
# # OperatingCarrierName.

# ticketing_mkt_shares = data |>
#   group_by(TicketingCarrierName, OriginCity) |>
#   summarize(Passengers = sum(Passengers)) |>
#   group_by(OriginCity) |>
#   mutate(market_share = Passengers / sum(Passengers), total_passengers = sum(Passengers)) |>
#   ungroup()

# filter(ticketing_mkt_shares, total_passengers > 1000) |> arrange(-market_share)

#   # American is much more dominant in Charlotte than before, for example
