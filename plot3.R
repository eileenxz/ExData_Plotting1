OriginFile <- file('./data/household_power_consumption.txt')
OriginData <- read.table(OriginFile,sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   na.strings = '?')
#extract subset
ExtractData <- OriginData[OriginData$Date == "1/2/2007" | 
                                  OriginData$Date == "2/2/2007",]

#plot3
plot(ExtractData$DateTime, ExtractData$Sub_metering_1, 
     xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(ExtractData$DateTime, ExtractData$Sub_metering_2, col = 'red')
lines(ExtractData$DateTime, ExtractData$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), lwd = 1,
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
plot(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_1)),
     type="l",xlab="",ylab="Energy sub metering")
lines(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_2)), 
      type="l",col="red")
lines(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_3)), 
      type="l",col="blue")
legend('topright', col = c('black', 'red', 'blue'), 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.copy(png,file = "./data/plot3.png")
dev.off()