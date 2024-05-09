test_that('Country name is in WorldPopulation', {
  expect_error(CountryPopulation('Kosovo'))
})
