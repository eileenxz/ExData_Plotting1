zipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(zipUrl, destfile = "./data/household_power_consumption.zip")
unzip("./data/household_power_consumption.zip", exdir = './data')

OriginFile <- file('./data/household_power_consumption.txt')
OriginData <- read.table(OriginFile,sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                   na.strings = '?')
#extract subset
ExtractData <- OriginData[OriginData$Date == "1/2/2007" | 
                                  OriginData$Date == "2/2/2007",]
#plot1
with(ExtractData, hist(as.numeric(as.character(Global_active_power)), 
                       xlab = "Global Active Power (kilowatt)",
                       main = "Global Active Power", col = "red"))
dev.copy(png,file = "./data/plot1.png")
dev.off()