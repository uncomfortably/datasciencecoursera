dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
dat <- subset(dat, dat$Date %in% c("1/2/2007", "2/2/2007"))
dat$Global_active_power <- as.numeric(dat$Global_active_power) 
png(file="plot1.png")
hist(dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

