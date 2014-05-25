NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Index of external combustion sources involving coal
index <- (grepl("Coal",SCC$Short.Name) & grepl("Ext Comb",SCC$Short.Name))
NEIcoal <- NEI[NEI$SCC %in% SCC$SCC[index],]

ag <- aggregate(NEIcoal$Emissions, by = list(NEIcoal$year), FUN=sum)

library(ggplot2)

x <- ag$Group.1
y <- ag$x
qplot(x, y, geom=c("line","point"),
      method=lm,se=FALSE,main="Yearly US MP2.5 Emissions from Coal related sources",
      xlab="Year",ylab="Emissions")
ggsave("plot4.png")