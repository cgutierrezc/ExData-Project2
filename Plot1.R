# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.

# Reading data files
d0 <- readRDS("summarySCC_PM25.rds")
d1 <- readRDS("Source_Classification_Code.rds")

#Total Emissions by year
sumPM <- with(d0, tapply(Emissions, year, sum, na.rm=TRUE))
df <- data.frame(year = names(sumPM), total = sumPM)

#Plotting data
png(file="plot1.png", width = 480, height = 480)

with(df, plot(year , total, type = "l", ylim = c(3000000, 8000000), 
              xlab = "Year",
              ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
              main = expression("Total US" ~ PM[2.5] ~ "Emissions by Year")))

dev.off()
