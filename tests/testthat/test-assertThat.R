library(testthat)

context("assertThat")

test_that("assertThat",{
  x = 1:10
  cond = inherits(x, "integer")
  failed_cond = inherits(x,"character")
  errormsg = "Not integer"
  expect_silent(assertThat(x, cond, errormsg))
  expect_error(assertThat(x, failed_cond, errormsg))
  expect_silent(checkThat(cond, errormsg))
  expect_equal(checkThat(failed_cond, errormsg),"Not integer")
  expect_silent(testThat(cond))
  expect_silent(isThat(cond))
})
