# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.


#Subsetting Baltimore City data
BC <- subset(d0, fips == "24510")

#Total Emissions by year
sumPM <- with(BC, tapply(Emissions, year, sum, na.rm=TRUE))
df <- data.frame(year = names(sumPM), total = sumPM)

#Plotting data
png(file="plot2.png", width = 480, height = 480)

with(df, plot(year , total, type = "l",  
              xlab = "Year",
              ylab = expression("Total" ~ PM[2.5] ~ "Emissions (tons)"),
              main = expression("Total Baltimore City" ~ PM[2.5] ~ "Emissions by Year")))

dev.off()



