data <- read.table('data/household_power_consumption.txt',header = TRUE, sep = ';')
data <- subset(data, Date=='1/2/2007' | Date=='2/2/2007')
dates <- data$Date
dates <- as.Date(dates, '%d/%m/%Y')
times <- data$Time
times <- strptime(data$Time, '%H:%M:%S')
times[1:1440] <- format(times[1:1440], '2007-02-01 %H:%M:%S')
times[1441:2880] <- format(times[1441:2880], '2007-02-02 %H:%M:%S')

png(file='plot3.png', width = 480, height = 480)
plot(times, data$Sub_metering_1, type = 'n',xlab='',ylab = '')
plot(times, as.numeric(data$Sub_metering_1), type = 'l')
lines(times, as.numeric(data$Sub_metering_2), col='red')
lines(times, as.numeric(data$Sub_metering_3), col='blue')
legend("topright", lty = 1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main = "Energy sub-metering")
dev.off()
