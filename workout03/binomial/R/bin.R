#' @title Binomial Choose
#' @description Calculates n choose k, the number of unique groups of size k that can be drawn from a group of size n
#' @param n integer representing the size of the population
#' @param k integer or vector of integers representing the size of the groups to draw from n
#' @return integer or vector of integers, the number of combinations
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)
#'
#' bin_choose(5, 0)
#'
#' bin_choose(5, 1:3)
bin_choose = function(n,k){
  if (!(all(k >= 0))){stop('k must be non-negative')}
  if (!all(as.integer(n)==n) | !all(as.integer(k)==k)){stop('n and k must be integers')}
  if (!(all(k <= n))){stop('k cannot be greater than n')}
  return(factorial(n)/(factorial(k)*factorial(n-k)))
}

#' @title Binomial Probability
#' @description Calculates the probability X = k for a binomial random variable X = Binomial(n,p)
#' @param success integer or vector of integers representing k, the total number of successes
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return float or a vector of floats, probability X = k
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#'
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#'
#' bin_probability(success = 55, trials = 100, prob = 0.45)
bin_probability = function(success,trials,prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success,trials)
  return(bin_choose(trials,success)*(prob^success)*((1-prob)^(trials-success)))
}


#' @title Binomial Distribution
#' @description Calculates the probability X = k a binomial random variable X = Binomial(n,p) for all k. Returns a data frame with primary class bindis.
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return Data frame with primary class bindis and with columns trials and probability
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#'
#' bin_distribution(100,.75)
bin_distribution = function(trials,prob){
  trials_seq = 0:trials
  probability = bin_probability(trials_seq,trials,prob)
  bindis = data.frame(trials = trials_seq, probability = probability)
  class(bindis) = c('bindis','data.frame')
  return(bindis)
}

#' @export
plot.bindis = function(bindis){
  barplot(bindis$probability, names.arg= bindis$trials, xlab='successes',ylab='probability', border=NA)
}

#' @title Binomial Cumulative
#' @description Calculates the probability X = k a binomial random variable X = Binomial(n,p) for all k, as well as the cumulative distribution, probability X <= k for all k
#' @param trials integer representing n, the total number of trials
#' @param prob float representing p, the probability of success on a given trial
#' @return Data frame with primary class bincum and with columns trials, probability, and cumulative
#' @export
#' @examples
#' bin_cumulative(trials = 5, prob = 0.5)
#'
#' bin_cumulative(100,.75)
bin_cumulative = function(trials,prob){
  bincum = bin_distribution(trials,prob)
  bincum$cumulative = rep(bincum$probability[1],trials+1)
  for (i in 1:trials+1){
    bincum$cumulative[i] = bincum$cumulative[i-1] + bincum$probability[i]
  }
  class(bincum) = c('bincum','data.frame')
  return(bincum)
}

#' @export
plot.bincum = function(bincum){
  plot(bincum$cumulative, x=bincum$trials, type='o', xlab='successes', ylab='probability')
}

