context("Check check functions")

test_that('check_prob works on good probs',{
  expect_true(check_prob(.5))
  expect_true(check_prob(1/10000))
  expect_true(check_prob(1))
})
test_that('check_prob errors on bad probs',{
  expect_error(check_prob(0L))
  expect_error(check_prob(5))
  expect_error(check_prob('one-half'))
  expect_error(check_prob(c(.1,.2,.3)))
  expect_error(check_prob(-.3))
})

test_that('check_trials works on good trials',{
  expect_true(check_trials(0))
  expect_true(check_trials(10000))
  expect_true(check_trials(3L))
})
test_that('check_trials fails on bad trials',{
  expect_error(check_trials(c(30,35,50)))
  expect_error(check_trials(-1))
  expect_error(check_trials('three'))
  expect_error(check_trials(3.5))
})

test_that('check_success works on good successes',{
  expect_true(check_success(c(1,2,3),3))
  expect_true(check_success(c(1827362319,132,2348),10**15))
  expect_true(check_success(0,5))
  expect_true(check_success(3L,10))
})
test_that('check_success fails on bad successes',{
  expect_error(check_success(-5,10))
  expect_error(check_success(c('one','two','three')))
  expect_error(check_success(c(3.2,7,1.8),5))
  expect_error(check_success(c(-5,3,6),7))
  expect_error(check_success(c(5,10),7))
})

context('Check summary statistics')

test_that('all measures return numbers',{
  expect_length(aux_mean(50,.5),1)
  expect_length(aux_variance(50,.5),1)
  expect_length(aux_mode(50,.5),1)
  expect_length(aux_skewness(50,.5),1)
  expect_length(aux_kurtosis(50,.5),1)
})

test_that('correct measures for n = 10, p = .3; given in assignment',{
  expect_equal(aux_mean(10,.3),3)
  expect_equal(aux_variance(10,.3),2.1)
  expect_equal(aux_mode(10,.3),3)
  expect_equal(round(aux_skewness(10,.3),7),0.2760262)
  expect_equal(round(aux_kurtosis(10,.3),7),-0.1238095)
})

test_that('correct measures for n = 5, p = .5; two modes',{
  expect_equal(aux_mean(5,.5),2.5)
  expect_equal(aux_variance(5,.5),1.25)
  expect_equal(aux_mode(5,.5),c(2,3))
  expect_equal(round(aux_skewness(5,.5),7),0)
  expect_equal(round(aux_kurtosis(5,.5),7),-0.4)
})

context('Check binomial functions')

test_that('bin_choose returns same length as success',{
  expect_equal(length(bin_choose(10,c(0,1,2,3))),length(c(0,1,2,3)))
  expect_equal(length(bin_choose(5,2)),length(2))
  expect_equal(length(bin_choose(100,0:100)),length(0:100))
})

test_that('bin_choose returns correct combinations',{
  expect_equal(bin_choose(5,0),1)
  expect_equal(bin_choose(10,5),252)
  expect_equal(bin_choose(2,0:2),c(1,2,1))
})

test_that('bin_choose fails on bad n and k values',{
  expect_error(bin_choose(5,6))
  expect_error(bin_choose(-5,-10))
  expect_error(bin_choose(5.5,2))
  expect_error(bin_choose(5,2.5))
  expect_error(bin_choose(10,c(1,5,11)))
})

test_that('bin_probability returns correct probabilities',{
  expect_equal(bin_probability(1,2,.5),.5)
  expect_equal(bin_probability(0,10,2/3),(1/3)^10)
  expect_equal(bin_probability(50,50,.4),.4^50)
})

test_that('bin_distribution returns data frame of correct dimensions',{
  expect_s3_class(bin_distribution(10,.5),'data.frame')
  expect_equal(nrow(bin_distribution(50,2/3)),length(0:50))
  expect_equal(ncol(bin_distribution(3,.6)),2)
})

test_that('bin_distribution returns correct probabilities',{
  expect_equal(bin_distribution(10,.5)[6,2],bin_probability(6-1,10,.5)) 
  expect_equal(bin_distribution(37,10/43)[11,2],bin_probability(11-1,37,10/43))
  expect_equal(bin_distribution(95,.87654)[69,2],bin_probability(69-1,95,.87654))
})

test_that('sum of bin_distribution probs is equal to 1',{
  expect_equal(sum(bin_distribution(10,.5)[,2]),1)
  expect_equal(sum(bin_distribution(37,10/43)[,2]),1)
  expect_equal(sum(bin_distribution(95,.87654)[,2]),1)
})

test_that('bin_cumulative returns data frame of correct dimensions',{
  expect_s3_class(bin_cumulative(10,.5),'data.frame')
  expect_equal(nrow(bin_cumulative(50,2/3)),length(0:50))
  expect_equal(ncol(bin_cumulative(3,.6)),3)  
})

test_that('last item in bin_cumulative is equal to 1',{
  expect_equal(bin_cumulative(10,.5)[11,3],1)
  expect_equal(bin_cumulative(37,10/43)[38,3],1)
  expect_equal(bin_cumulative(95,.987654)[96,3],1)
})

test_that('second column in bin_cumulative is equal to second column in bin_distribution',{
  expect_equal(bin_cumulative(10,.5)[,2],bin_distribution(10,.5)[,2])
  expect_equal(bin_cumulative(37,10/43)[,2],bin_distribution(37,10/43)[,2])
  expect_equal(bin_cumulative(95,.987654)[,2],bin_distribution(95,.987654)[,2])
})

test_that('bin_cumulative returns correct probabilities',{
  expect_equal(bin_cumulative(2,.5)[,3],c(.25,.75,1))
})