#' @title Binomial Random Variable
#' @description Creates an object of class binvar, a list containing the number of trials and the probability of success on each trial
#' @param trials integer representing n, the total number of trials 
#' @param prob float representing p, the probability of success on a given trial
#' @return a named list of class binvar, containing the number of trials and the probability
#' @export
#' @examples 
#' bin_variable(10,.5)
#' 
#' bin_variable(100,2/3)
bin_variable = function(trials,prob){
  check_trials(trials)
  check_prob(prob)
  bin = list(trials,prob)
  names(bin) = c('trials','prob')
  class(bin) = 'binvar'
  return(bin)
}

#' @export
print.binvar = function(bin){
  cat('"Binomial variable"\n\nParamaters\n')
  cat(paste0('- number of trials: ',bin$trials,'\n'))
  cat(paste0('- prob of success : ',round(bin$prob,7)))
}

#' @export
summary.binvar = function(bin){
  trials=bin$trials
  prob=bin$prob
  lst = list(trials,prob,aux_mean(trials,prob),aux_variance(trials,prob),aux_mode(trials,prob),aux_skewness(trials,prob),aux_kurtosis(trials,prob))
  names(lst) = c('trials','prob','mean','variance','mode','skewness','kurtosis')
  class(lst) = 'summary.binvar'
  return(lst)
}

#' @export
print.summary.binvar = function(lst){
  cat('"Summary Binomial"\n\nParamaters\n')
  cat(paste0('- number of trials: ',lst$trials,'\n'))
  cat(paste0('- prob of success : ',round(lst$prob,7),'\n\nMeasures\n'))
  cat(paste0('- mean    : ',round(lst$mean,7),'\n'))
  cat(paste0('- variance: ',round(lst$variance,7),'\n'))
  if (length(lst$mode)==2){cat(paste0('- mode    : ',lst$mode[1],' and ',lst$mode[2],'\n'))}
  else{cat(paste0('- mode    : ',lst$mode,'\n'))}
  cat(paste0('- skewness: ',round(lst$skewness,7),'\n'))
  cat(paste0('- kurtosis: ',round(lst$kurtosis,7)))
}