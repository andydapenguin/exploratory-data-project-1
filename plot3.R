#load data
path <- './Downloads/household_power_consumption.txt'
colNames <- as.vector(c('date', 'time', 'global_active', 'global_reactive', 
                        'voltage', 'global_intensity', 'sub_meter_1', 'sub_meter_2', 'sub_meter_3'))
fullset <- read.table(path,
                      header = FALSE, 
                      sep = ';',
                      col.names = colNames,
                      stringsAsFactors = FALSE, 
                      na.strings = '?')
#subset for dates
fullset$date <- as.Date(fullset$date, format='%d/%m/%Y')
data <- subset(fullset, date >= '2007-02-01' & date <= '2007-02-02') 

#date conversions
datetime <- paste(as.Date(data$date), data$time)
data$time <- as.POSIXct(datetime)

#plot 3rd chart
with(data, {
   plot(sub_meter_1~time, type="l",
        ylab="Global Active Power (kilowatts)", xlab="")
   lines(Sub_meter_2~time,col='Red')
   lines(Sub_meter_3~time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#save to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
