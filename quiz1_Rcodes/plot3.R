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

#plot3
dat2$Sub_metering_2 = as.numeric(dat2$Sub_metering_2)
dat2$Sub_metering_1 = as.numeric(dat2$Sub_metering_1)
png(file = "plot3.png", width = 480, height = 480)
with(dat2, plot(x = DT, y = Sub_metering_1, type = "l",
                ylab = "Energy sub metering",
                xlab = ""))
with(dat2, lines(x = DT, y = Sub_metering_2, type = "l",
                 ylim = range(Sub_metering_1), col = "red"))
with(dat2, lines(x = DT, y = Sub_metering_3, type = "l",
                 ylim = range(Sub_metering_1), col = "blue"))
legend("topright", 
       col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()