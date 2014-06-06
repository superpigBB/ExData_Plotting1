setwd("/Users/baoj/Documents/R/")
#install.packages("graphics")
#install.packages("grDevices")
library(graphics)
library(grDevices)
library(lattice)
library(grid)

dat = read.table("household_power_consumption.txt", header = TRUE,
                 stringsAsFactors = FALSE, sep = ";")
dat2 = subset(dat, dat$Date == "1/2/2007" | dat$Date == "2/2/2007")
dat2$Date = dmy(dat2$Date)


#plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(dat2, plot(x = DT, y = Global_active_power, type = "l",
                ylab = "Global Active Power",
                xlab = ""))

dat2$Voltage = as.numeric(dat2$Voltage)
with(dat2, plot(x = DT, y = Voltage, type = "l",
                ylab = "Voltage",
                xlab = "datetime"))


with(dat2, plot(x = DT, y = Sub_metering_1, type = "l",
                ylab = "Energy sub metering",
                xlab = ""))
with(dat2, lines(x = DT, y = Sub_metering_2, type = "l",
                 ylim = range(Sub_metering_1), col = "red"))
with(dat2, lines(x = DT, y = Sub_metering_3, type = "l",
                 ylim = range(Sub_metering_1), col = "blue"))
legend("topright", 
       col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7,
       bty = "n")


dat2$Global_reactive_power = as.numeric(dat2$Global_reactive_power)
with(dat2, plot(x = DT, y = Global_reactive_power, type = "l",
                ylab = "Global_reactive_power",
                xlab = "datetime"))
dev.off()
