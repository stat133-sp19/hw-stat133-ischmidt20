library(ggplot2)

#' @title future_value
#' @description calculates resulting value of investing a certain amount in a financial product that offers a given return rate over a certain number of years
#' @param amount number
#' @param rate number
#' @param years number
#' @return resulting value number
future_value = function(amount,rate,years){
  return(amount * ((1+rate)^years))
}

#' @title annuity
#' @description calculates resulting value of investing a certain contrib in a financial product each year for a certain number of years that offers a given return rate
#' @param contrib number
#' @param rate number
#' @param years number
#' @return resulting value number
annuity = function(contrib,rate,years){
  return(contrib * ((((1+rate)^years)-1)/rate))
}

#' @title gowing_annuity
#' @description calculates resulting value of investing a certain contrib that grows via growth each year for a certain number of years in a financial product that offers a given return rate
#' @param contrib number
#' @param rate number
#' @param growth number
#' @param years number
#' @return resulting value number
growing_annuity = function(contrib,rate,growth,years){
  return(contrib*(((1+rate)^years - (1+growth)^years)/(rate-growth)))
}

no_contrib=c()
fixed_contrib=c()
growing_contrib=c()
years=seq(0,10)
for (i in years){
  no_annuity = future_value(amount=1000,rate=.05,years=i)
  no_contrib=c(no_contrib,no_annuity)
  fixed_contrib=c(fixed_contrib,no_annuity+annuity(contrib=200,rate=.05,years=i))
  growing_contrib=c(growing_contrib,no_annuity+growing_annuity(contrib=200,rate=.05,growth=.03,years=i))
}
modalities=data.frame(year=years,no_contrib=no_contrib,fixed_contrib=fixed_contrib,growing_contrib=growing_contrib)

timeline = ggplot(data=modalities) +
  geom_line(aes(x=year,y=no_contrib,colour='#0e4884')) +
  geom_line(aes(x=year,y=fixed_contrib,colour='#d83025')) + 
  geom_line(aes(x=year,y=growing_contrib,colour='#cf9131')) +
  ggtitle('Performance of Various Investment Methods') +
  xlab('Year') + ylab('Total Amount') +
  scale_y_continuous(minor_breaks = seq(0 , 4500, 100), breaks = seq(0, 4500,500),limits=c(0,4500)) +
  scale_x_continuous(minor_breaks = seq(0,10,1), breaks = seq(0,10,2),limits=c(0,10)) +
  scale_colour_identity('modality',guide='legend',labels=c('no_contrib','growing_contrib','fixed_contrib'))

timeline

investment_type=c()
no_contrib=c()
fixed_contrib=c()
growing_contrib=c()
years = seq(0,20)
for (i in c(1,2,3)){
  rate = switch(i,.001,.0225,.065)
  type = switch(i,'regular savings','high-yield savings','index fund')
  for (year in years){
    investment_type=c(investment_type,type)
    no_annuity = future_value(amount=10000,rate=rate,years=year)
    no_contrib=c(no_contrib,no_annuity)
    fixed_contrib=c(fixed_contrib,no_annuity+annuity(contrib=2000,rate=rate,years=year))
    growing_contrib=c(growing_contrib,no_annuity+growing_annuity(contrib=2000,rate=rate,growth=.04,years=year))
  }
  data = data.frame(investment=investment_type,year=years,no_contrib=no_contrib,fixed_contrib=fixed_contrib,growing_contrib=growing_contrib)
}

data$investment = factor(data$investment,levels=c('regular savings','high-yield savings','index fund'))
plt = ggplot(data=data) + facet_grid( ~ investment) +
  geom_line(aes(x=year,y=no_contrib,colour='#0e4884')) +
  geom_line(aes(x=year,y=fixed_contrib,colour='#d83025')) + 
  geom_line(aes(x=year,y=growing_contrib,colour='#cf9131')) +
  ggtitle('Performance of Various Investment Methods with Various Financial Products') +
  xlab('year') + ylab('balance') +
  scale_y_continuous(minor_breaks = seq(0 , 150000, 10000), breaks = seq(0, 150000,50000),limits=c(0,150000),expand=c(0,0)) +
  scale_x_continuous(minor_breaks = seq(0,20,1), breaks = seq(0,20,5),limits=c(0,20),expand=c(0,0)) +
  scale_colour_identity('modality',guide='legend',labels=c('no_contrib','growing_contrib','fixed_contrib'))
plt