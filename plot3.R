
##import data
mydata <- read.delim2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

##convert Date to appropriate format
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

##subset data
mydata1 <- subset(mydata,Date >= '2007-02-01' & Date <= '2007-02-02')

##convert factor variable to numeric
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

##setup png dimensions
png("plot3.png", width=480, height=480)

##plot
plot(mydata1$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering",xaxt="n")
lines(mydata1$Sub_metering_2, col="red")
lines(mydata1$Sub_metering_3, col="blue")
legend("topright",col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1))
axis(1,at=c(0,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()