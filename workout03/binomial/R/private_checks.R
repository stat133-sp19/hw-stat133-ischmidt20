
# checks to make sure the probability is a float between 0 and 1, inclusive
check_prob = function(prob){
  if (length(prob) != 1){stop('probability must be one number, not a list')}
  if (typeof(prob) != 'double'){stop('probability must be a float. Avoid representing 0 or 1 as integers.')}
  if (prob < 0 | prob > 1){stop('p must be between 0 and 1')}
  return(TRUE)
}

# checks to make sure the number of trials is a non-negative integer
check_trials = function(trials){
  if (length(trials) != 1){stop('trials must be one number, not a list')}
  if (trials < 0){stop('trials must be non-negative')}
  if (as.integer(trials) != trials){stop('trials must be an integer')}
  return(TRUE)
}

# checks to make sure all values in success vector are less than or equal to the number of trials
check_success = function(success,trials){
  if (!(all(success >= 0))){stop('success must be non-negative')}
  if (!(all(success <= trials))){stop('success can not be greater than trials')}
  return(TRUE)
}
