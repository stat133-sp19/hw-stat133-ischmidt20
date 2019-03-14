# Shot Charts

# Produces shot charts for each player

# Takes in one file with all shots across all players

# Outputs .png and .pdf files displaying shot charts

# import required packages
library(ggplot2)
library(jpeg)
library(grid)

# import data
col_classes = c('factor','character','integer','integer','integer','integer','factor','factor','factor','integer','factor','integer','integer','factor','integer')
shots = read.csv('../data/shots-data.csv',sep=',',colClasses=col_classes)

# import image
court_file <- "../images/nba-court.jpg"
court_image <- rasterGrob( readJPEG(court_file), width = unit(1, "npc"), height = unit(1, "npc"))

# make individual shot charts as PDFs
pdf(file = "../images/andre-iguodala-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots[shots$name == 'Andre Iguodala',]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  ggtitle('Shot Chart: Andre Iguodala (2016-17 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/draymond-green-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots[shots$name == 'Draymond Green',]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  ggtitle('Shot Chart: Draymond Green (2016-17 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/kevin-durant-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots[shots$name == 'Kevin Durant',]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  ggtitle('Shot Chart: Kevin Durant (2016-17 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/klay-thompson-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots[shots$name == 'Klay Thompson',]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  ggtitle('Shot Chart: Klay Thompson (2016-17 season)') +
  theme_minimal()
dev.off()

pdf(file = "../images/stephen-curry-shot-chart.pdf", width=6.5, height=5)
ggplot(data = shots[shots$name == 'Stephen Curry',]) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  ggtitle('Shot Chart: Stephen Curry (2016-17 season)') +
  theme_minimal()
dev.off()

# Make faceted PDF and PNG shot charts

faceted_chart = ggplot(data = shots) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag, shape=shot_made_flag)) +
  ylim(-50, 420) +
  scale_shape_manual(values=c(4,1)) +
  scale_color_manual(values=c('#e81828','#2ECC40')) +
  theme_minimal() +
  theme(legend.position = "top", legend.title = element_blank()) +
  facet_wrap(~ name) +
  ggtitle('Shot Charts: Golden State Warriors (2016-17 season)')

pdf(file = "../images/gsw-shot-charts.pdf", width=8, height=7)
faceted_chart
dev.off()

png(filename = "../images/gsw-shot-charts.png", width=8, height=7, units='in', res=150)
faceted_chart
dev.off()