library(testthat)

context("stopwarn")

test_that("warn",{
  expect_warning(stopwarn("warn", "This number is too big"))
})

test_that("stop",{
  expect_error(stopwarn("stop", "This number is too big"))
})
