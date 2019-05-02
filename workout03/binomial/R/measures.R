# mean = np
aux_mean = function(trials,prob){
  return(trials*prob)
}

# variance = np(1-p)
aux_variance = function(trials,prob){
  return(trials*prob*(1-prob))
}

# mode = m = int(np+p); if m is integer, return two modes, m and m-1
aux_mode = function(trials,prob){
  m = trials*prob+prob
  if (as.integer(m) == m){return(c(m-1,m))}
  return(as.integer(m))
}

# skewness = (1-2p)/((np(1-p))^.5)
aux_skewness = function(trials,prob){
  return((1-2*prob)/((trials*prob*(1-prob))**.5))
}

# kurtosis = (1-6p(1-p))/(np(1-p))
aux_kurtosis = function(trials,prob){
  return((1-6*prob*(1-prob))/(trials*prob*(1-prob)))
}


#' @title Binomial Mean
#' @description Calculates the mean of a binomial distribution with given trials and probability
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return mean of the distribution
#' @export
#' @examples
#' bin_mean(10,.3)
#'
#' bin_mean(100,2/3)
bin_mean = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mean(trials,prob))
}

#' @title Binomial Variance
#' @description Calculates the variance of a binomial distribution with given trials and probability
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return variance of the distribution
#' @export
#' @examples
#' bin_variance(10,.3)
#'
#' bin_variance(100,2/3)
bin_variance = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_variance(trials,prob))
}

#' @title Binomial Mode
#' @description Calculates the mode of a binomial distribution with given trials and probability
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return mode of the distribution; if there are two modes, return a vector containaing both modes
#' @export
#' @examples
#' bin_mode(10,.3)
#'
#' bin_mode(100,2/3)
bin_mode = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_mode(trials,prob))
}

#' @title Binomial Skewness
#' @description Calculates the skewness of a binomial distribution with given trials and probability
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return skewness of the distribution
#' @export
#' @examples
#' bin_skewness(10,.3)
#'
#' bin_skewness(100,2/3)
bin_skewness = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_skewness(trials,prob))
}

#' @title Binomial Kurtosis
#' @description Calculates the kurtosis of a binomial distribution with given trials and probability
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return kurtosis of the distribution
#' @export
#' @examples
#' bin_kurtosis(10,.3)
#'
#' bin_kurtosis(100,2/3)
bin_kurtosis = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  return(aux_kurtosis(trials,prob))
}
