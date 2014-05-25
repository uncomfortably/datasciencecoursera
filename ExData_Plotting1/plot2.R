dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
dat <- subset(dat, dat$Date %in% c("1/2/2007", "2/2/2007"))
dat$Global_active_power <- as.numeric(dat$Global_active_power) 
dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
dat$DateTime <- strptime(paste(dat$Date,dat$Time), format = "%Y-%m-%d %H:%M:%S")

png(file="plot2.png")
plot(dat$DateTime, dat$Global_active_power, type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
