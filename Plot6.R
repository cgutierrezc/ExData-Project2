# Question 6:
# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (fips == 06037).
# Which city has seen greater changes over time in motor vehicle emissions?


# Subsetting data by County Baltimore or L.A. and type = On Road
OR <- subset(d0, (fips == "24510" | fips == "06037") & type=="ON-ROAD")
# Use more meaningful variable names
OR <- transform(OR, region = ifelse(fips == "24510", "Baltimore City",
                                    "Los Angeles County"))

sumPM <- ddply(OR, .(year, region), function(x) sum(x$Emissions))
colnames(sumPM)[3] <- "Emissions"

# Create a plot normalized 
BC1 <- subset(sumPM, year == 1999 & region == "Baltimore City")$Emissions
LA1 <- subset(sumPM, year == 1999 & region == "Los Angeles County")$Emissions
sumPMNorm <- transform(sumPM, EmissionsNorm =
                         ifelse(region == "Baltimore City",
                                Emissions / BC1,
                                Emissions / LA1))


#Plotting the Data
png(file="plot6.png", width = 480, height = 480)

with(sumPMNorm, qplot(year, EmissionsNorm, geom="line", color=region) +
       ggtitle(expression("Total" ~ PM[2.5] ~ "Motor Vehicle Emissions Normalized to 1999 Levels")) +
       xlab("Year") + ylab(expression("Normalized" ~ PM[2.5] ~ "Emissions")))

dev.off()
