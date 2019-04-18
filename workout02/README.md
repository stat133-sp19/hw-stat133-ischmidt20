# Workout 2 Assignment

*Due: April 17*

by Isaac Schmidt

This homework assignment involved creating an R shiny app that plots the returns of various financial investment strategies, based on user input. We used functions written in an earlier warmup assignment to calculate the value of a savings account after a certain number of years given an initial amount, interest rate, the annual contribution to the account, and how much that contribution grew every year.

Below is a brief description of the shiny app.

### User-Defined Inputs

- Initial Amount: How much money to be initially placed in the account

- Annual Contribution: How much money is to be added to the account every year

- Return Rate: The annual return on investment. In the case of a savings account, this can be treated as the interest rate.

- Growth Rate: How much the annual contribution grows every year; see below

- Years: How many years to plot the account balance

- Facet?: Determines the style of the plot shown; see below

### Timelines

This section displays a plot of the account balance in three cases:

- `no_contrib`: No new money is added to the account.

- `fixed_contrib`: A certain amount of money is added to the account each year.

- `growing_contrib`: A certain amount of money that grows every year is added to the account each year. For example, if the annual contribution is set to $1000 and the growth rate is set to 10%, the contribution in the second year will grow to $1100.

If the user has selected "No" facet, then the balance will be shown as three separate lines on the same graph.

If the user has selected "Yes" facet, then each type of contribution will be displayed on its own graph, along with an area under the curve.

### Balances

This selection displays the raw data that is displayed in the above plot. The user may find this useful for importing into other software to do additional calculations or something similar.

Finally, there is another file in this directory named `scripts.R`. This file contains the code directly copied from the Warmup 6 assignment. What is of note here are the defined functions that calculate account balance given the above parameters. These functions are then loaded into `app.R` in order for the app to function properly.
