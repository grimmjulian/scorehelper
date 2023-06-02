test_that("server function for score_app works", {
  p <- shiny::reactiveVal()
  shiny::testServer(scoreServer, args = list(pairing = p), {
    p(methods::new("Pairing", home = methods::new("Routine", endvalue = 1.5)))
    session$flushReact()
    expect_equal(output$home, "4")
    expect_equal(output$guest, "0")
  })
})
