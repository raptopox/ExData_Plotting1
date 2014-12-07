## Read the .txt file of the data into R. 
## We assume that the file "household_power_consumption.txt" is on our working directory.
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";")

## Convert the data$Date Variable to Date format.
data$Date<-as.Date(data$Date, "%d/%m/%Y")

## Select only rows corresponding to dates "2007-02-01" or "2007-02-02".
data<-data[data$Date=="2007-02-01" | data$Date=="2007-02-02",]

## Transform the Global_active_power variable into numeric.
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))

## Open the png device, make the histogram and close the device.
png("plot1.png", width=480, height=480)
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()