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

#plot2
png(file = "plot2.png", width = 480, height = 480)
with(dat2, plot(x = DT, y = Global_active_power, type = "l",
                ylab = "Global Active Power (kilowatts)",
                xlab = ""))
dev.off()