## R script to create 'plot1.png'

## Download the zip file for 'Individual household electric power consumption Data Set' made available
## on the course website and extract it into the working directory


## 'na.strings' argument in the read.csv replaces any '?' values with NA 
hpc <- read.csv(file = 'household_power_consumption.txt', sep = ';', head = TRUE, na.strings = '?')
splitted <- subset(hpc, as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-01', format = '%Y-%m-%d') | as.Date(hpc$Date, format = '%d/%m/%Y') == as.Date('2007-02-02', format = '%Y-%m-%d'))
png(file = 'plot1.png', width = 480, height = 480)
hist(splitted$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()