library(dplyr)

PowerData <- read.table("./household_power_consumption.txt",header = TRUE, sep=";")
PowerData<-tbl_df(PowerData)
PowerData$Date <- as.Date(PowerData$Date,format="%d/%m/%Y")
test<-PowerData[PowerData$Date == ("2007-02-01") | PowerData$Date == ("2007-02-02"),]

test$Time <- as.POSIXct(paste(test$Date, test$Time), format="%Y-%m-%d %H:%M:%S")
#str(test)

test$Global_active_power <- as.numeric(test$Global_active_power)
test$Sub_metering_1 <- as.numeric(test$Sub_metering_1)
test$Sub_metering_2 <- as.numeric(test$Sub_metering_2)
test$Sub_metering_3 <- as.numeric(test$Sub_metering_3)

png(file = "plot1.png")

hist(test$Global_active_power,col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
#dev.copy(png, file="plot1.png")
dev.off()