#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
source('scripts.R')

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Balance Growth for Various Financial Modalities"),

    
   fluidRow(
        column(4,
         sliderInput("amount",
                     "Initial Amount",
                     min = 0,
                     max = 100000,
                     value = 1000, step = 500, pre='$'),
         sliderInput("contribution",
                     "Annual Contribution",
                     min = 0,
                     max = 50000,
                     value = 2000, step = 500, pre='$')),
        column(4,
         sliderInput("return_rate",
                     "Return Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 5, step = .1),
         sliderInput("growth_rate",
                     "Growth Rate (in %)",
                     min = 0,
                     max = 20,
                     value = 2, step=.1)),
        column(4,
         sliderInput("years",
                           "Years",
                           min = 0,
                           max = 50,
                           value = 20, step=1),
         selectInput("facet",
                     "Facet?",
                     choices = c('No','Yes'),
                     selected = 'No')
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
        h4('Timelines'),
         plotOutput("distPlot"),
         
         h4('Balances'),
         verbatimTextOutput('balances')
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  modalities = reactive({
    no_contrib=c()
    fixed_contrib=c()
    growing_contrib=c()
    years=seq(0,input$years)
    for (i in years){
      no_annuity = future_value(amount=input$amount,rate=input$return_rate/100,years=i)
      no_contrib=c(no_contrib,no_annuity)
      fixed_contrib=c(fixed_contrib,no_annuity+annuity(contrib=input$contribution,rate=input$return_rate/100,years=i))
      growing_contrib=c(growing_contrib,no_annuity+growing_annuity(contrib=input$contribution,rate=input$return_rate/100,growth=input$growth_rate/100,years=i))
    }
    data = data.frame(year=years,no_contrib=no_contrib,fixed_contrib=fixed_contrib,growing_contrib=growing_contrib)
    #data$investment = factor(data$investment,levels=c('regular savings','high-yield savings','index fund'))
    return(data)
  })
  
   facet = reactive({switch(input$facet,'Yes'=TRUE,'No'=FALSE)})
   
   output$balances = renderPrint({modalities()})
   
   output$distPlot <- renderPlot({
     data = modalities()
     if(facet()){
      modes=data.frame(year=rep(0,(input$years+1)*3),contrib=rep(0,(input$years+1)*3),money=rep(0,(input$years+1)*3))
      modes$year = rep(data$year,3)
      modes$contrib = rep(c('no_contrib','fixed_contrib','growing_contrib'),each=input$years+1)
      modes$money = c(data$no_contrib,data$fixed_contrib,data$growing_contrib)
      modes$contrib = factor(modes$contrib,levels=c('no_contrib','fixed_contrib','growing_contrib'))
       timeline = ggplot(data=modes) + facet_grid(~ contrib) +
         geom_area(aes(x=year,y=money,fill=contrib),alpha=.5) +
         geom_point(aes(x=year,y=money,color=contrib)) +
         geom_line(aes(x=year,y=money,color=contrib)) +
         ggtitle('Three modes of investing') +
         xlab('Year') + ylab('Total Amount')
     }
     else{
        timeline = ggplot(data=data) + 
       geom_line(aes(x=year,y=no_contrib,colour='#0e4884')) + geom_point(aes(x=year,y=no_contrib,colour='#0e4884'),size=1) +
       geom_line(aes(x=year,y=fixed_contrib,colour='#cf9131')) + geom_point(aes(x=year,y=fixed_contrib,colour='#cf9131'),size=1) +
       geom_line(aes(x=year,y=growing_contrib,colour='#d83025')) + geom_point(aes(x=year,y=growing_contrib,colour='#d83025'),size=1) +
       ggtitle('Three modes of investing') +
       xlab('Year') + ylab('Total Amount') +
       scale_colour_discrete('modality',guide='legend',labels=c('no_contrib','fixed_contrib','growing_contrib'))
     }
     timeline
   },width=900)
}

# Run the application 
shinyApp(ui = ui, server = server)

