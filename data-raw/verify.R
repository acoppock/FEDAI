source("data-raw/helpers.R")

# Rebuilds every dataset and compares it against the copy in data/. Run it after
# editing any build script: a build that no longer reproduces what the package
# ships is the failure worth catching, and the values matter rather than the
# attributes, so tibble class and readr's column spec are ignored.

built <- new.env()
sys.source("data-raw/book_tables.R", envir = built)
sys.source("data-raw/studies.R", envir = built)
sys.source("data-raw/exercise_datasets.R", envir = built)

shipped <- new.env()
for (f in list.files("data", full.names = TRUE)) load(f, envir = shipped)

report <-
  tibble(dataset = sort(ls(shipped))) |>
  mutate(
    result = map_chr(dataset, function(nm) {
      if (!exists(nm, envir = built, inherits = FALSE)) return("NOT BUILT")
      new <- get(nm, envir = built)
      old <- get(nm, envir = shipped)
      if (is.matrix(old)) {
        comparison <- all.equal(unname(new), unname(old))
      } else {
        comparison <- all.equal(
          as.data.frame(new), as.data.frame(old),
          check.attributes = FALSE
        )
      }
      if (isTRUE(comparison)) "OK" else paste(comparison, collapse = "; ")
    })
  )

print(report, n = Inf, width = 200)
print(table(report$result == "OK"))
