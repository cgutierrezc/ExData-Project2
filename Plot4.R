# Question 4:
# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999-2008?

#Subsetting data from coal combustion
ccr <- c("Fuel Comb - Comm/Institutional - Coal",
         "Fuel Comb - Electric Generation - Coal",
         "Fuel Comb - Industrial Boilers, ICEs - Coal")
CC <- subset(d1, EI.Sector %in% ccr)

# Compare to Short.Name matching both Comb and Coal
CC1 <- subset(d1, grepl("Comb", Short.Name) & grepl("Coal", Short.Name))

CCodes <- union(CC$SCC, CC1$SCC)
str(CCodes)
#chr [1:103] "10100101" "10100102" "10100201" "10100202" "10100203" "10100204" ...

CC0 <- subset(d0, SCC %in% CCodes)

ccsumPM <- ddply(CC0, .(year, type), function(x) sum(x$Emissions))

colnames(ccsumPM)[3] <- "Emissions"

#Plotting the Data
png(file="plot4.png", width = 480, height = 480)

with(ccsumPM, qplot(year, Emissions, color = type, 
                    geom = "line") + 
       ggtitle(expression("Coal Combustion" ~ PM[2.5] ~
                            "Emissions by Source Type and Year")) +
       xlab("Year") + ylab(expression  ("Total" ~ PM[2.5] ~
                                          "Emissions (tons)")))

dev.off()
