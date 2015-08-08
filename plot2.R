
library(dplyr)
library(lubridate)

# Reads the dataset, changing the defaukt separator and asigning '?' as NA value.
powerConsumption <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')

powerConsumption$DateTime <- dmy_hms(paste(powerConsumption$Date, powerConsumption$Time))

dateFilteredPowerConsupmtion <- filter(powerConsumption, 
    DateTime %within% new_interval(ymd('2007-02-01'), ymd_hm('2007-02-02 23:59')))

plot(x = dateFilteredPowerConsupmtion$DateTime, 
     y = dateFilteredPowerConsupmtion$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

dev.copy(device = png, file = 'plot2.png', width = 480, height = 480)

dev.off()

