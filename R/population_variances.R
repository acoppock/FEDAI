#' Population variance
#'
#' Divides by `N` rather than `N - 1`, which is what a schedule of potential
#' outcomes calls for: the seven villages in Table 2.1 are the population, not a
#' sample drawn from one. [stats::var()] divides by `N - 1`.
#'
#' @param x a numeric vector
#' @param na.rm logical. Should missing values be removed? When `FALSE` (the
#'   default) a single missing value makes the result `NA`, as in
#'   [stats::var()]. When `TRUE` missing values are dropped and the divisor is
#'   the number of values that remain.
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' pop_var(x) # divides by n
#'
#' # For comparision
#' var(x) # divides by n - 1
#'
#' pop_var(c(1, 2, NA, 4)) # NA
#' pop_var(c(1, 2, NA, 4), na.rm = TRUE) # divides by 3
pop_var <- function(x, na.rm = FALSE) {
  if (na.rm) x <- x[!is.na(x)]
  sum((x - mean(x))^2) / length(x)
}

#' Population covariance
#'
#' Divides by `N` rather than `N - 1`. See [pop_var()].
#'
#' @param x a numeric vector
#' @param y a numeric vector
#' @param na.rm logical. Should missing values be removed? When `TRUE` a pair is
#'   dropped when either element is missing, and the divisor is the number of
#'   complete pairs.
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' y <- c(4, 3, 2, 1)
#' pop_cov(x, y)
#' # for comparison
#' cov(x, y)
pop_cov <- function(x, y, na.rm = FALSE) {
  if (na.rm) {
    complete <- !is.na(x) & !is.na(y)
    x <- x[complete]
    y <- y[complete]
  }
  sum((x - mean(x)) * (y - mean(y))) / length(x)
}

#' Population standard deviation
#'
#' Divides by `N` rather than `N - 1`. See [pop_var()].
#'
#' @param x a numeric vector
#' @param na.rm logical. Should missing values be removed?
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' pop_sd(x) # divides by n
#'
#' # For comparision
#' sd(x) # divides by n - 1
pop_sd <- function(x, na.rm = FALSE) {
  sqrt(pop_var(x = x, na.rm = na.rm))
}
