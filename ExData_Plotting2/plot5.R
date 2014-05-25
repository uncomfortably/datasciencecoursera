NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Combines both off-road and on-road sources, though it appears off-road is generally minimal
index <- grepl("Highway",SCC$SCC.Level.Two,ignore.case=TRUE) 
NEIVehicle <- NEI[NEI$SCC %in% SCC$SCC[index],]

NEIBaltVehicle <- NEIVehicle[NEIVehicle$fips %in% c("24510"),]

ag <- aggregate(NEIBaltVehicle$Emissions, by = list(NEIBaltVehicle$year, NEIBaltVehicle$type), FUN=sum)

library(ggplot2)

x <- ag$Group.1
y <- ag$x
type <- factor(ag$Group.2)
q <- qplot(x, y, facets=type ~ ., geom=c("line","point"),
           main="Baltimore MP2.5 Vehicle Emissions by type",
           xlab="Year",ylab="Emissions")
q + facet_grid(type ~ ., scales="free_y")

ggsave("plot5.png")
