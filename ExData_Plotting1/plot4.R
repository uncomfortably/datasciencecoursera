prepData <- function() {
        dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors = FALSE)
        dat <- subset(dat, dat$Date %in% c("1/2/2007", "2/2/2007"))
        dat$Date <- as.Date(dat$Date,format="%d/%m/%Y")
        dat$DateTime <- strptime(paste(dat$Date,dat$Time), format = "%Y-%m-%d %H:%M:%S")
        dat$Global_active_power <- as.numeric(dat$Global_active_power)
        dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)
        dat$Voltage <- as.numeric(dat$Voltage)
        dat$Sub_metering_1 <- as.numeric(dat$Sub_metering_1) 
        dat$Sub_metering_2 <- as.numeric(dat$Sub_metering_2) 
        dat$Sub_metering_3 <- as.numeric(dat$Sub_metering_3)       
}

plot_active_power <- function() {
        plot(dat$DateTime, dat$Global_active_power, type="l",ylab="Global Active Power",xlab="")
}

plot_submetering <- function() {
        plot(dat$DateTime, dat$Sub_metering_1, type="l", ylab="Energy sub metering",xlab="")
        lines(dat$DateTime, dat$Sub_metering_2, type="l", col="red")
        lines(dat$DateTime, dat$Sub_metering_3, type="l", col="blue")
        legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black","red","blue"), cex=.9)
}

plot_voltage <- function() {
        plot(dat$DateTime, dat$Voltage, type="l",ylab="Voltage",xlab="datetime")
}

plot_reactive_power <- function() {
        plot(dat$DateTime, dat$Global_reactive_power, type="l",ylab="Global_reactive_Power",xlab="datetime")
}

prepData()
png(file="plot4.png")
par(mfcol=c(2,2))
plot_active_power()
plot_submetering()
plot_voltage()
plot_reactive_power()
dev.off()



