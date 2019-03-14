# Data Preparation Script

# R Scipt to turn the individual raw data files into one large table
# Inputs are the shot data files for the five players
# Output is one large data table

col_classes = c('factor','character','integer','integer','integer','integer','factor','factor','factor','integer','factor','integer','integer')

# Read in files for each individual player
curry = read.csv('../data/stephen-curry.csv', colClasses = col_classes, header=TRUE, stringsAsFactors = FALSE)
iggy = read.csv('../data/andre-iguodala.csv', colClasses = col_classes, header=TRUE, stringsAsFactors = FALSE)
dray = read.csv('../data/draymond-green.csv', colClasses = col_classes, header=TRUE, stringsAsFactors = FALSE)
kd = read.csv('../data/kevin-durant.csv', colClasses = col_classes, header=TRUE, stringsAsFactors = FALSE)
klay = read.csv('../data/klay-thompson.csv', colClasses = col_classes, header=TRUE, stringsAsFactors = FALSE)

# Add a column to each player's data frame containing their name, to be used when combining data frames later
curry$name = 'Stephen Curry'
iggy$name = 'Andre Iguodala'
dray$name = 'Draymond Green'
kd$name = 'Kevin Durant'
klay$name = 'Klay Thompson'

# Replace shot_made_flag indicators with more descriptive names
levels(curry$shot_made_flag) = c('shot_no','shot_yes')
levels(iggy$shot_made_flag) = c('shot_no','shot_yes')
levels(dray$shot_made_flag) = c('shot_no','shot_yes')
levels(kd$shot_made_flag) = c('shot_no','shot_yes')
levels(klay$shot_made_flag) = c('shot_no','shot_yes')

# Add column minute to each data frame to indicate the minute of the game from which the shot was taken, counting up from 1
curry$minute = (12-curry$minutes_remaining) + 12*(curry$period-1)
iggy$minute = (12-iggy$minutes_remaining) + 12*(iggy$period-1)
dray$minute = (12-dray$minutes_remaining) + 12*(dray$period-1)
kd$minute = (12-kd$minutes_remaining) + 12*(kd$period-1)
klay$minute = (12-klay$minutes_remaining) + 12*(klay$period-1)

# Output summaries of each data frame to files in output folder
sink(file='../output/stephen-curry-summary.txt')
summary(curry)
sink()
sink(file='../output/andre-iguodala-summary.txt')
summary(iggy)
sink()
sink(file='../output/draymond-green-summary.txt')
summary(dray)
sink()
sink(file='../output/kevin-durant-summary.txt')
summary(kd)
sink()
sink(file='../output/klay-thompson-summary.txt')
summary(klay)
sink()

# combine 5 data frames into 1 data frame
all = rbind(curry,iggy,dray,kd,klay)

# write combined data to single file
write.table(all,file='../data/shots-data.csv',sep=',',row.names=FALSE,quote=FALSE)

# write sumamry of shots to file
sink(file='../output/shots-data-summary.txt')
summary(all)
sink()