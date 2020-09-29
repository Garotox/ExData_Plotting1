data <- read.table('data/household_power_consumption.txt',header = TRUE, sep = ';')
data <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')
dates <- data$Date
dates <- as.Date(dates, '%d/%m/%Y')
times <- data$Time
times <- strptime(data$Time, '%H:%M:%S')

times[1:1440] <- format(times[1:1440], '2007-02-01 %H:%M:%S')
times[1441:2880] <- format(times[1441:2880], '2007-02-02 %H:%M:%S')
png(file='plot2.png', width = 480, height = 480)
plot(times, as.numeric(data$Global_active_power), type = 'l', xlab = '', ylab = 'Global Active Power (kilowatts)', main = '')
dev.off()
