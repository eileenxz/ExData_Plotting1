OriginFile <- file('./data/household_power_consumption.txt')
OriginData <- read.table(OriginFile,sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   na.strings = '?')
#extract subset
ExtractData <- OriginData[OriginData$Date == "1/2/2007" | 
                                  OriginData$Date == "2/2/2007",]
                                  
#plot4
png(filename="./data/plot4.png", width=480, height=480, units="px")
par(mfrow = c(2, 2))
#part1
plot(ExtractData$DateTime,as.numeric(as.character(ExtractData$Global_active_power)),
     ylab="Global Active Power", xlab="",type="l")
#part2
plot(ExtractData$DateTime, ExtractData$Voltage, 
     xlab = 'datetime', ylab = 'Voltage', type = 'l')
#part3
plot(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_1)),
     type="l",xlab="",ylab="Energy sub metering")
lines(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_2)), 
      type="l",col="red")
lines(ExtractData$DateTime,as.numeric(as.character(ExtractData$Sub_metering_3)), 
      type="l",col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lwd=1,lty=c(1,1,1))
#part4
plot(ExtractData$DateTime, as.numeric(as.character(ExtractData$Global_active_power)), 
     xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
dev.off()