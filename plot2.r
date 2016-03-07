########## GRAPH # 2 #############

# Reading and filtering the data based on the date.
data = read.table('household_power_consumption.txt', sep=";", header = T)
data['Date'] <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data = data[(data[,1]=="2007-02-01") | (data[,1]=="2007-02-02"),]


# converting levels into the numbers 
data$Global_active_power = as.numeric(as.character(data$Global_active_power))


# creating/opening a png file, plotting the graph, and closing the graphics device.
png('plot2.png')
plot(strptime(paste(as.character(data[,1]),as.character(data[,2]),sep=''), "%Y-%m-%d%H:%M:%S"),data$Global_active_power,type="l", ylab = 'Global Active Power', xlab ='')
dev.off()
