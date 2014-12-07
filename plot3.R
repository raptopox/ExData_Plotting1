## Read the .txt file of the data into R. 
## We assume that the file "household_power_consumption.txt" is on our working directory.
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Convert the data$Date Variable to Date format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## Select only rows corresponding to dates "2007-02-01" or "2007-02-02".
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

## Make an extra variable DataTime that contains the information of the variables Data and Time in POSIXlt/POSIXt format. 
data$DateTime<-strptime(paste(as.character(data$Date), as.character(data$Time)), "%Y-%m-%d %H:%M:%S")

## Transform the Sub_metering_1 and Sub_metering_2 variables into numeric (Sub_metering_3 is already numeric).
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))

## Open the png device, make the plot and close the device.
png("plot3.png", width=480, height=480)
plot(data$DateTime, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()