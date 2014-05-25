NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

ag <- aggregate(NEI$Emissions, by = list(NEI$year), FUN=sum)
png(file="plot1.png")
plot(ag,type="l", main="Yearly US Emissions of PM2.5", xlab="Year", ylab="Total Emissions")
points(ag,col="red",pch=16)
dev.off()