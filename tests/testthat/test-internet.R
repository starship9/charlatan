context("InternetProvider works")

test_that("InternetProvider works", {
  aa <- InternetProvider$new()

  expect_is(aa, "InternetProvider")
  expect_is(aa, "R6")

  expect_is(aa$tld, "function")
  expect_is(aa$tld(), "character")

  expect_is(aa$ascii_email, "function")
  expect_match(aa$ascii_email(), "\\@")

  expect_is(aa$domain_name, "function")
  expect_is(aa$domain_name(), "character")

  expect_is(aa$email, "function")
  expect_is(aa$email(), "character")
  expect_match(aa$email(), "\\@")

  expect_is(aa$image_url(), "character")
  expect_match(aa$image_url(), "http")
})

