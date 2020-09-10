# Question 3:
# Of the four types of sources indicated by the type (point, nonpoint, onroad,
# nonroad) variable, which of these four sources have seen decreases in
# emissions from 1999-2008 for Baltimore City? Which have seen increases in
# emissions from 1999-2008? Use the ggplot2 plotting system to make a plot
# answer this question.

library(plyr)
library(ggplot2)

#Total Emissions by Source and year
sumPM <- ddply (BC, .(year, type), function(x) sum(x$Emissions))
colnames(sumPM)[3] <- "Emissions"


#Plotting data
png(file="plot3.png", width = 480, height = 480)

with(sumPM, qplot(year, Emissions, color = type, geom = "line") +
  ggtitle(expression("Baltimore City" ~ PM[2.5] ~ 
                       "Emissions by Source Type and Year")) + xlab("Year") +
  ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)")))


dev.off()
