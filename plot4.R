## Read the .txt file of the data into R. 
## We assume that the file "household_power_consumption.txt" is on our working directory.
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Convert the data$Date Variable to Date format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## Select only rows corresponding to dates "2007-02-01" or "2007-02-02".
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

## Make an extra variable DataTime that contains the information of the variables Data and Time in POSIXlt/POSIXt format. 
data$DateTime<-strptime(paste(as.character(data$Date), as.character(data$Time)), "%Y-%m-%d %H:%M:%S")

## Transform the Global_active_power variable into numeric.
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

## Transform the Global_active_power variable into numeric.
data$Voltage<-as.numeric(as.character(data$Voltage))

## Transform the Sub_metering_1 and Sub_metering_2 variables into numeric (Sub_metering_3 is already numeric).
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))

## Transform the Global_reactive_power variable into numeric.
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))


## Open the png device, make the plot and close the device.
png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

## Top-left plot
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")

## Top-right plot
plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", type="l")

## Bottom-left plot
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Bottom-right plot
plot(data$DateTime, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

dev.off()