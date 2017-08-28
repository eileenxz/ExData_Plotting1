OriginFile <- file('./data/household_power_consumption.txt')
OriginData <- read.table(OriginFile,sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   na.strings = '?')
#extract subset
ExtractData <- OriginData[OriginData$Date == "1/2/2007" | 
                                  OriginData$Date == "2/2/2007",]
                                  
#plot2
ExtractData$Date <- as.Date(ExtractData$Date, format = '%d/%m/%Y')
ExtractData$DateTime <- as.POSIXct(paste(ExtractData$Date, ExtractData$Time))
plot(ExtractData$DateTime,as.numeric(as.character(ExtractData$Global_active_power)),
     ylab="Global Active Power", xlab="",type="l")
dev.copy(png,file = "./data/plot2.png")
dev.off()