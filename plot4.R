## R script to create 'plot4.png'

## Download the zip file for 'Individual household electric power consumption Data Set' made available
## on the course website and extract it into the working directory

## na.strings argument in the read.csv replaces any '?' values with NA
hpc <- read.csv(file = 'household_power_consumption.txt', sep = ';', head = TRUE, na.strings = '?')
splitted <- subset(hpc, as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-01', format = '%Y-%m-%d') | as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-02', format = '%Y-%m-%d'))

## Combining Date and Time fields and converting with strptime
date = as.character(paste(splitted$Date, splitted$Time))
datetime = strptime(date, format = '%d/%m/%Y %H:%M:%S')

## Creating the plot
png(file = 'plot4.png', width = 480, height = 480)
par(mfcol = c(2, 2))

## Adding first plot
plot(x = datetime, y = splitted$Global_active_power, type ='l', xlab = '', ylab = 'Global Active Power')

## Adding second plot
plot(x = datetime, y = splitted$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type ='l')
points(x = datetime, y = splitted$Sub_metering_2, col = 'red', type = 'l')
points(x = datetime, y = splitted$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), pch = '—', bty = 'n')

## Adding third plot
plot(x = datetime, y = splitted$Voltage, ylab = 'Voltage', type ='l')

## Adding fourth plot
plot(x = datetime, y = splitted$Global_reactive_power, ylab = 'Global_reactive_power', type ='l')

dev.off()