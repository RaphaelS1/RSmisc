library(testthat)

context("nerror")

nerror <- 1/2

test_that("nerror",{
  expect_equal(ifnerror(nerror,return("nerror"),"warn",TRUE),"nerror")
  expect_equal(ifnerror(nerror,return("nerror"),"stop",TRUE),"nerror")
  expect_equal(ifnerror(nerror,return("nerror"),"warn",FALSE),"nerror")
  expect_equal(ifnerror(nerror,return("nerror"),"stop",FALSE),"nerror")
})

error <- function() return(1/"a")

test_that("error",{
  expect_warning(ifnerror(error(),return("nerror"),"warn",TRUE))
  expect_error(ifnerror(error(),return("nerror"),"stop",TRUE))
  expect_warning(ifnerror(error(),return("nerror"),"warn",TRUE))
  expect_error(ifnerror(error(),return("nerror"),"stop",TRUE))
})
