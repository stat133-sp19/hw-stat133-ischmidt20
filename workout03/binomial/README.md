# Workout 3 Assignment

*Due: May 3*

by Isaac Schmidt

This homework involves creating a basic R package that works with the binomial distribution. The motivation behind this assignment was to understand the basics of creating an R package.

### Installation

You can install using the `devtools` package with `devtools::install_github("ischmidt20/workout03/binomial")`.

Alternatively, you can download and install the compressed `binomial_0.0.0.9000.tar.gz` file.

### Basic Functionality

 - Create a binomial random variable using `bin_variable`, and use `summary` to see the mean, variance, mode, skewness, and kurtosis of the variable.

 - Find select probabilities with `bin_probability`, or calculate all probabilities with `bin_distribution`.

 - Obtain the cumulative distribution with `bin_cumulative`.

 - Easily plot `bin_probability` and `bin_cumulative` results with the `plot` function.


 See the included introductory vignette for more details.
