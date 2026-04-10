#' @export
load_data = function(datafile, cityfile, carrierfile){
  
  data = readr::read_csv(datafile) 
  carriers = readr::read_csv(carrierfile)
  data = dplyr::left_join(data, dplyr::rename(carriers, OperatingCarrierName = "Description"), by = c(OpCarrier = "Code"))
  data = dplyr::left_join(data, dplyr::rename(carriers, TicketingCarrierName = "Description"), by = c(TkCarrier = "Code"))
  
  market_ids = readr::read_csv(cityfile)
  data = dplyr::left_join(data, dplyr::rename(market_ids, OriginCity = "Description"), by = c(OriginCityMarketID = "Code"))
  data = dplyr::left_join(data, dplyr::rename(market_ids, DestCity = "Description"), by = c(DestCityMarketID = "Code"))

  return(data)
}

# these functions to add these packages to DESCRIPTION
# usethis::use_package("dplyr")
# usethis::use_package("readr")


# an R file under R folder is created, containing Roxygen(?)
#usethis::use_import_from("dplyr", c("summarize", "group_by", "mutate", "first", "if_else", "filter", "ungroup", "arrange", "summarize"))
