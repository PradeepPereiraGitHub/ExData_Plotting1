library(dplyr)

PowerData <- read.table("./household_power_consumption.txt",header = TRUE, sep=";")
PowerData<-tbl_df(PowerData)
PowerData$Date <- as.Date(PowerData$Date,format="%d/%m/%Y")
test<-PowerData[PowerData$Date == ("2007-02-01") | PowerData$Date == ("2007-02-02"),]
# 
test$Time <- as.POSIXct(paste(test$Date, test$Time), format="%Y-%m-%d %H:%M:%S")
# #str(test)
# 
test$Global_active_power <- as.numeric(test$Global_active_power)
test$Sub_metering_1 <- as.numeric(test$Sub_metering_1)
test$Sub_metering_2 <- as.numeric(test$Sub_metering_2)
test$Sub_metering_3 <- as.numeric(test$Sub_metering_3)


plot(test$Time,test$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)",type="s")
dev.copy(png, file="plot2.png")
dev.off()