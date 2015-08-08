
library(dplyr)
library(lubridate)

# Reads the dataset, changing the defaukt separator and asigning '?' as NA value.
powerConsumption <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')

powerConsumption$datetime <- dmy_hms(paste(powerConsumption$Date, powerConsumption$Time))

dateFilteredPowerConsupmtion <- filter(powerConsumption, 
    datetime %within% new_interval(ymd('2007-02-01'), ymd_hm('2007-02-02 23:59')))

par(mfrow = c(2, 2), cex = 0.6)
with(dateFilteredPowerConsupmtion, {
  
    plot(x = datetime, y = Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
  
    plot(x = datetime, y = Voltage, type='l')

    plot(x = datetime, y = Sub_metering_1, ylab='Energy sub metering', xlab='', type='n')
    legend("topright", lty = 1, col = c('black', 'red', 'blue'), 
           legend = c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'), bty = 'n')
    lines(x = datetime, y = Sub_metering_1, type = 'l')
    lines(x = datetime, y = Sub_metering_2, type = 'l', col = 'red')
    lines(x = datetime, y = Sub_metering_3, type = 'l', col = 'blue')

    plot(x = datetime,      y = Global_reactive_power,     type='l')
})

dev.copy(device = png, file = 'plot4.png', width = 480, height = 480)

dev.off()
