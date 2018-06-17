
##import data
mydata <- read.delim2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

##convert Date to appropriate format
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

##subset data
mydata1 <- subset(mydata,Date >= '2007-02-01' & Date <= '2007-02-02')

##convert factor variable to numeric
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

##setup png dimensions
png("plot2.png", width=480, height=480)

##plot
plot(mydata1$Global_active_power,type="l",xaxt="n",xlab="", ylab="Global Active Power (kilowatts)")
axis(1,at=c(0,1440,2880),labels=c("Thu", "Fri", "Sat"))
dev.off()