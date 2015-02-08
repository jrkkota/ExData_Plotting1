
## Read the Household Power Consumption File into R 
dataFile<-read.table("data/household_power_consumption-2.txt",header=TRUE,sep=";",col.names=c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses=c("factor","factor","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = c("?","NA"))
## Extract household energy usage in the specified Range
dateRange<-(dataFile$Date=='1/2/2007' | dataFile$Date=='2/2/2007')
powerUsage<-dataFile[dateRange,]
##Create the png File to store the plot
png("data/plot1.png", width=480, height=480)

##Draw the histogram using the hist() function
hist(powerUsage$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")
dev.off()