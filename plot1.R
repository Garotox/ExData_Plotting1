data <- read.table('data/household_power_consumption.txt',header = TRUE, sep = ';')
data <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')
dates <- data$Date
dates <- as.Date(dates, '%d/%m/%Y')
times <- data$Time
times <- strptime(data$Time, '%H:%M:%S')
times <- sub('.*\\s+', "",times)
png(file='plot1.png', width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col ='red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()
