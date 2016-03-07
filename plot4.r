########## GRAPH # 4 #############

# Reading and filtering the data based on the date.
data = read.table('household_power_consumption.txt', sep=";", header = T)
data['Date'] <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data = data[(data[,1]=="2007-02-01") | (data[,1]=="2007-02-02"),]

# converting all variables of ubterest from level into numbers
for (i in 3:9){
  data[,i] = as.numeric(as.character(data[,i]))
}

# opening a png graphics device
png('plot4.png')

# so that all four graphs will be placed on one output
par(mfcol=c(2,2))

# copied from the Graph #2
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Global_active_power,type="l", ylab = 'Global Active Power',  xlab ='')

# copied from the Graph #3
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_1,type="l", ylab = 'Energy Sub Metering', xlab ='')
lines(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_2, col="Red")
lines(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_3, col="Blue")
legend("topright", legend = c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'), col = c('Black','Red','Blue'), lty = 1)

# plotting the Voltage
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Voltage,type="l", ylab = 'Voltage', lwd =.02, xlab ='datetime')

# plotting the Global Reactive Power
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Global_reactive_power,type="l", ylab = 'Global Reactive Power', xlab ='datetime')

# closing the device
dev.off()