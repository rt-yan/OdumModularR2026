test_that("busiest routes returns correct route", {
  file = system.file("testdata/passengers.csv", package = "OdumModularDesignR") # finding files inside installed packages
  data = read.csv(file)
  routes = busiest_routes(data, from, to)
  expect_equal(routes$airport1, c("JFK", "CLT"))
  expect_equal(routes$airport2, c("SFO", "RDU"))
  expect_equal(routes$Passengers, c(4, 3))

})

