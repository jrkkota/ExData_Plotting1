## Read the Household Power Consumption File into R 
dataFile<-read.table("data/household_power_consumption-2.txt",header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("?","NA"))
## Extract household energy usage in the specified Range
dateRange<-(dataFile$Date=='1/2/2007' | dataFile$Date=='2/2/2007')
powerUsage<-dataFile[dateRange,]

## Create a png file owf width 480 and height 480
png("plot3.png", width=480, height=480)
plot(1:length(powerUsage$Time),powerUsage$Sub_metering_1,"l",xaxt="n",xlab=NA,ylab="Energy sub metering")
lines(1:length(powerUsage$Time),powerUsage$Sub_metering_2,col="red","l",xaxt="n",xlab=NA,ylab="Energy sub metering")
lines(1:length(powerUsage$Time),powerUsage$Sub_metering_3,col="blue","l",xaxt="n",xlab=NA,ylab="Energy sub metering")
axis(1,at=c(1,0.5*length(powerUsage$Time), length(hpc_to_use$Time)),c("Thu","Fri","Sat"))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=3,col=c("black","red","blue"))
dev.off()