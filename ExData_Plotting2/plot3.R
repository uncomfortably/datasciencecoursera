NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIbalt <- NEI[NEI$fips == "24510",]
ag <- aggregate(NEIbalt$Emissions, by = list(NEIbalt$year, NEIbalt$type), FUN=sum)

library(ggplot2)

x <- ag$Group.1
y <- ag$x
type <- factor(ag$Group.2)
q <- qplot(x, y, facets=type~., geom=c("line","point","smooth"),
      method=lm,se=FALSE,main="Baltimore MP2.5 Emissions by type",
      xlab="Year",ylab="Emissions")
q + theme(axis.text.x=element_text(angle=90))
q + facet_grid(type~., scales="free_y")
ggsave("plot3.png")
