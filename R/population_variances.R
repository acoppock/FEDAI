


#' Population variance
#'
#' @param x a numeric vector
#' @param na.rm logical. Should missing values be removed?
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' pop_var(x) # divides by n
#'
#' # For comparision
#' var(x) # divides by n - 1
pop_var <-
  function(x, na.rm = FALSE){
    x_bar <- mean(x, na.rm = na.rm)
    N <- sum(!is.na(x))
    sum((x - x_bar)^2)/N
  }

#' Population covariance
#'
#' @param x a numeric vector
#' @param y a numeric vector
#' @param na.rm logical. Should missing values be removed?
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' y <- c(4, 3, 2, 1)
#' pop_cov(x, y)
#' # for comparison
#' cov(x, y)
pop_cov <-
  function(x, y, na.rm = FALSE){
    x_bar <- mean(x, na.rm = na.rm)
    y_bar <- mean(y, na.rm = na.rm)
    N <- sum(!is.na(x))
    sum((x - x_bar)*(y - y_bar))/N
  }

#' Population standard deviation
#'
#' @param x a numeric vector
#' @param na.rm logical. Should missing values be removed?
#'
#' @export
#'
#' @examples
#' x <- c(1, 2, 3, 4)
#' sd_var(x) # divides by n
#'
#' # For comparision
#' sd(x) # divides by n - 1
sd_var <-
  function(x, na.rm = FALSE){
    sqrt(pop_var(x = x, na.rm = na.rm))
  }
