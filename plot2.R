#plot2
ExtractData$Date <- as.Date(ExtractData$Date, format = '%d/%m/%Y')
ExtractData$DateTime <- as.POSIXct(paste(ExtractData$Date, ExtractData$Time))
plot(ExtractData$DateTime,as.numeric(as.character(ExtractData$Global_active_power)),
     ylab="Global Active Power", xlab="",type="l")
dev.copy(png,file = "./data/plot2.png")
dev.off()