
library(dplyr)

# Reads the dataset, changing the defaukt separator and asigning '?' as NA value.
powerConsumption <- read.csv('household_power_consumption.txt', sep = ';', na.strings = '?')

powerConsumption$Date1 <- as.Date(strptime(powerConsumption$Date, format = '%d/%m/%Y'))

dateFilteredPowerConsupmtion <- filter(powerConsumption, Date1 >= as.Date('2007-02-01') 
                                       & Date1 <= as.Date('2007-02-02'))

hist(dateFilteredPowerConsupmtion$Global_active_power, main = "Global Active Power", 
     col = 'red', xlab = 'Global Active Power')

dev.copy(device = png, file = 'plot1.png', width = 480, height = 480)

dev.off()



