library(dplyr)

PowerData <- read.table("./household_power_consumption.txt",header = TRUE, sep=";", colClasses="character")
PowerData<-tbl_df(PowerData)
PowerData$Date <- as.Date(PowerData$Date,format="%d/%m/%Y")
test<-PowerData[PowerData$Date == ("2007-02-01") | PowerData$Date == ("2007-02-02"),]

test$Time <- as.POSIXct(paste(test$Date, test$Time), format="%Y-%m-%d %H:%M:%S")
#str(test)

test$Global_active_power <- as.numeric(test$Global_active_power)
test$Sub_metering_1 <- as.numeric(test$Sub_metering_1)
#test$Sub_metering_1 <- as.numeric(levels(test$Sub_metering_1))[test$Sub_metering_1]
test$Sub_metering_2 <- as.numeric(test$Sub_metering_2)
#test$Sub_metering_2 <- as.numeric(levels(test$Sub_metering_2))[test$Sub_metering_2]
test$Sub_metering_3 <- as.numeric(test$Sub_metering_3)
#test$Sub_metering_3 <- as.numeric(levels(test$Sub_metering_3))[test$Sub_metering_3]

# par(mfrow=c(2,2))
# plot(test$Time,test$Sub_metering_1,xlab="", ylab="Energy sub metering",type="s", col="black", ylim=c(0,40))
# plot(test$Time,test$Sub_metering_2,xlab="", ylab="Energy sub metering",type="s", col="red", ylim=c(0,40))
# plot(test$Time,test$Sub_metering_3,xlab="", ylab="Energy sub metering",type="s", col="blue", ylim=c(0,40))

#Write plot to .png file
png(file = "plot3.png")

with(test,plot(Time,Sub_metering_1,xlab="", ylab="Energy sub metering",type="s", col="black"))
with(subset(test, Sub_metering_1>=0), lines(Time, Sub_metering_1, col = "black"))
with(subset(test, Sub_metering_2>=0), lines(Time, Sub_metering_2, col = "red"))
with(subset(test, Sub_metering_3>=0), lines(Time, Sub_metering_3, col = "blue"))
legend("topright", pch = "_", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# DOES NOT WORK
# with(test,plot(Time,Sub_metering_1,type="n"))
# with(test,plot(Time,Sub_metering_1,xlab="", ylab="Energy sub metering",type="s", col="black", ylim=c(0,40)))
# with(test,plot(Time,Sub_metering_2,xlab="", ylab="Energy sub metering",type="s", col="red", ylim=c(0,40)))
# with(test,plot(Time,Sub_metering_3,xlab="", ylab="Energy sub metering",type="s", col="blue", ylim=c(0,40)))
#    
# legend("topright", pch = "_", col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#dev.copy(png, file="plot3.png")
dev.off()