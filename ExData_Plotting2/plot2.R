NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIbalt <- NEI[NEI$fips == "24510",]
ag <- aggregate(NEIbalt$Emissions, by = list(NEIbalt$year), FUN=sum)
png(file="plot2.png")
plot(ag,type="l", main="Yearly Baltimore Emissions of PM2.5", xlab="Year", ylab="Total Emissions")
points(ag,col="red",pch=16)
dev.off()
