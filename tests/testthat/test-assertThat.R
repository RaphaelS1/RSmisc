library(testthat)

context("assertThat")

test_that("assertThat",{
  x = 1:10
  cond = inherits(x, "integer")
  errormsg = "Not integer"
  expect_silent(assertThat(x, cond, errormsg))
  expect_silent(checkThat(cond, errormsg))
  expect_silent(testThat(cond))
  expect_silent(isThat(cond))
})
