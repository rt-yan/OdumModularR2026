# Compute market share in an airport or city

Compute market share in an airport or city, with flexibility to specify
how the carrier is defined

## Usage

``` r
mktshares(dataframe, carrier, location)
```

## Arguments

- dataframe:

  Dataset to be based market share off of, should have a Passengers
  column

- carrier:

  Column name containing carrier name of each ticket, unquoted

- location:

  Column name containing the origination, unquoted

## Value

a dataframe with the carrier and orig columns and a market_share column
that contains the market share of that carrier in that location, as a
proportion.

## Examples
