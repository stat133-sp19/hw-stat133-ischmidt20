# Workout 1 Assignment

*Due: March 13*

by Isaac Schmidt

This homework involves working with shot data for selected members of the 2016-17 Golden State Warriors. We had to download the data, clean it up, and use it to create shot shot charts and data tables for each player. The final part of the assignment involved writing a report analyzing and explaining the data.

Below is a description of each of the files in this project folder.

### `code`

`make-shot-charts-script.R`: This code takes in the cleaned up data, and outputs individual shot charts for each player in PDF format, along with a faceted shot chart in both PNG and PDF format.

`make-shots-data-script.R`: This code takes in the five individual data files, cleans them up, and combines them into one file. Changes made to the data include:
- Replacing "y" and "n" in the `shot_made_flag` with "shot_yes" and "shot_no".
- Adding a column `minute` that shows the exact minute of the game in which the shot was taken, and integer from 1 to 48.
- Adding a `name` column so that it is clear who took each shot in the combined file.

### `data`

Individual data files, listing shots for each player described in the file name:
- `andre-iguodala.csv`
- `draymond-green.csv`
- `kevin-durant.csv`
- `klay-thompson.csv`
- `stephen-curry.csv`

`data-dictionary.md`: A data dictionary file explaining each of the columns in the above five files.

`shots-data.csv`: The combined data file with all shots taken by all five players, with the modifications described above.

### `images`

Individual shot charts:
- `andre-iguodala-shot-chart.pdf`
- `draymond-green-shot-chart.pdf`
- `kevin-durant-shot-chart.pdf`
- `klay-thompson-shot-chart.pdf`
- `stephen-curry-shot-chart.pdf`

`nba-court.jpg`: The diagram of a basketball court used as the background image in the shot charts.

`gsw-shot-charts.pdf` and `gsw-shot-charts.png`: Faceted shot charts for all five players in one file, available both in PDF and PNG format.

### `output`

All of these files display summary statistics for each column from the given data. This includes minimum, mean, median, maximum, and 1st and 3rd quartiles for numerical data, and then counts for categorical data. There are individual summary data files for each player as well as a combined file `shots-data-summary.txt` which summarizes the data across all players.

### `report`

`workout01-isaac-schmidt.Rmd`: The Rmd file used to create the final report. Includes R code and other information not displayed in the final report.

`workout01-isaac-schmidt.md`: The final report in markdown syntax.
