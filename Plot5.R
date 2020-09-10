# Question 5:
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

# Subsetting data by Baltimore City and type= On Road
BCOR <- subset(d0, fips == "24510" & type=="ON-ROAD")

sumPM <- ddply(BCOR, .(year), function(x) sum(x$Emissions))
colnames(sumPM)[2] <- "Emissions"



#Plotting the Data
png(file="plot5.png", width = 480, height = 480)

with(sumPM, qplot(year, Emissions, geom="line") +
       ggtitle(expression("Baltimore City" ~ PM[2.5] ~
       "Motor Vehicle Emissions by Year")) + xlab("Year") +
       ylab(expression("Total" ~ PM[2.5] ~ "Emissions (tons)")))

dev.off()                                     
