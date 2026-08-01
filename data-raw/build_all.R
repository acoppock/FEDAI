source("data-raw/helpers.R")

# Rebuilds every .rda in data/ from source. Run from the package root:
#   Rscript data-raw/build_all.R
# then `Rscript data-raw/verify.R` to confirm each object matches what is
# shipped, and re-run the test suite, which pins dimensions and summary
# statistics for the datasets used in exercises.

built <- new.env()
sys.source("data-raw/book_tables.R", envir = built)
sys.source("data-raw/studies.R", envir = built)
sys.source("data-raw/exercise_datasets.R", envir = built)

datasets <- setdiff(ls(built), c("coords", "draws", "n_hotspots"))

for (nm in datasets) {
  assign(nm, get(nm, envir = built))
  save(list = nm, file = file.path("data", paste0(nm, ".rda")), compress = "bzip2")
}

print(tibble(dataset = datasets, bytes = file.size(file.path("data", paste0(datasets, ".rda")))),
      n = Inf)
