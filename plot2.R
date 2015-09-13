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

#plot 2nd chart
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
