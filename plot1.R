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
active_power <- as.numeric(data$global_active) 

#create plot
hist(active_power, main="Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col='Red')

#save plot
dev.copy(png, file="plot1.png", height=504, width=504)
dev.off()
