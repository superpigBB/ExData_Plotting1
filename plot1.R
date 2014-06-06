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

#plot1
library(lubridate)
dat2$DT = ymd_hms(paste(dat2$Date, dat2$Time, sep = "_"))
dat2$Global_active_power = as.numeric(dat2$Global_active_power)
par(mar = c(4,4,2,3))
png(file = "plot1.png", width = 480, height = 480)
hist(dat2$Global_active_power, col = "red", ylab = "Frequency", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", cex.main = 1)
dev.off()