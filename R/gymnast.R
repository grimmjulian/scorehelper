methods::setClass(
  "Gymnast",
  slots = c(
    id = "numeric",
    name = "character",
    birthday = "Date",
    nationality = "character",
    url = "character"
  ),
  prototype = list(
    id = NA_integer_,
    name = NA_character_,
    birthday = NA,
    nationality = NA_character_,
    url = NA_character_
  )
)
