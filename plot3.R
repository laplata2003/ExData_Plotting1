
library(dplyr)
library(lubridate)

# Reads the dataset, changing the defaukt separator and asigning '?' as NA value.
powerConsumption <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')

powerConsumption$DateTime <- dmy_hms(paste(powerConsumption$Date, powerConsumption$Time))

dateFilteredPowerConsupmtion <- filter(powerConsumption, 
    DateTime %within% new_interval(ymd('2007-02-01'), ymd_hm('2007-02-02 23:59')))

plot(x = dateFilteredPowerConsupmtion$DateTime, 
     y = dateFilteredPowerConsupmtion$Sub_metering_1, 
     ylab='Energy sub metering', xlab='', type='n')

legend("topright", lty = 1, col = c('black', 'red', 'blue'), 
       legend = c('Sub metering 1', 'Sub metering 2', 'Sub metering 3') )

lines(x = dateFilteredPowerConsupmtion$DateTime, 
      y = dateFilteredPowerConsupmtion$Sub_metering_1, 
      type = 'l')

lines(x = dateFilteredPowerConsupmtion$DateTime, 
      y = dateFilteredPowerConsupmtion$Sub_metering_2, 
      type = 'l', col = 'red')

lines(x = dateFilteredPowerConsupmtion$DateTime, 
      y = dateFilteredPowerConsupmtion$Sub_metering_3, 
      type = 'l', col = 'blue')

dev.copy(device = png, file = 'plot3.png', width = 480, height = 480)

dev.off()

