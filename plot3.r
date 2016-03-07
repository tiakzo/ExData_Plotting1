########## GRAPH # 3 #############

# Reading and filtering the data based on the date.
data = read.table('household_power_consumption.txt', sep=";", header = T)
data['Date'] <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data = data[(data[,1]=="2007-02-01") | (data[,1]=="2007-02-02"),]

# converting all sub metering variables from level into numbers
for (i in 7:9){
  data[,i] = as.numeric(as.character(data[,i]))
}



# creating/opening a png file, plotting the graph, adding the lines and legend, and closing the graphics device.
png('plot3.png')
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_1,type="l", ylab = 'Energy Sub Metering', xlab ='')
lines(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_2, col="Red")
lines(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Sub_metering_3, col="Blue")
legend("topright", legend = c('Sub metering 1', 'Sub metering 2', 'Sub metering 3'), col = c('Black','Red','Blue'), lty = 1)
dev.off()
