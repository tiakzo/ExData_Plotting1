
########## GRAPH # 1 #############

# Reading and filtering the data based on the date.
data = read.table('household_power_consumption.txt', sep=";", header = T)
data['Date'] <- as.Date(as.character(data[,1]),"%d/%m/%Y")
data = data[(data[,1]=="2007-02-01") | (data[,1]=="2007-02-02"),]


# converting levels into the numbers 
data$Global_active_power = as.numeric(as.character(data$Global_active_power))


# creating/opening a png file, plotting the graph, and closing the graphics device.
png("plot1.png")
hist(data$Global_active_power, col = "Red", xlab =  'Global Active Power (kilowatts)', main = 'Global Active Power')
dev.off()