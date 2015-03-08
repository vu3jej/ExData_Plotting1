## R script to create 'plot2.png'

## Download the zip file for 'Individual household electric power consumption Data Set' made available
## on the course website and extract it into the working directory


## na.strings argument in the read.csv replaces any '?' values with NA
hpc <- read.csv(file = 'household_power_consumption.txt', sep = ';', head = TRUE, na.strings = '?')
splitted <- subset(hpc, as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-01', format = '%Y-%m-%d') | as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-02', format = '%Y-%m-%d'))

## Combining Date and Time fields and converting with strptime
date = as.character(paste(splitted$Date, splitted$Time))
datetime = strptime(date, format = '%d/%m/%Y %H:%M:%S')

## Creating the plot
png(file = 'plot2.png', width = 480, height = 480, bg = "transparent")
plot(x = datetime, y = splitted$Global_active_power, type ='l', xlab = '', ylab = 'Global Active Power (kilowatts)')
dev.off()