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

## Open the png device, make the plot and close the device.
png("plot2.png", width=480, height=480)
plot(data$DateTime, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.off()