
##import data
mydata <- read.delim2("household_power_consumption.txt", header=TRUE, sep=";", dec=".", na.strings="?")

##convert Date to appropriate format
mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")

##subset data
mydata1 <- subset(mydata,Date >= '2007-02-01' & Date <= '2007-02-02')

##convert factor variable to numeric
mydata1$Global_active_power <- as.numeric(mydata1$Global_active_power)

##setup png dimensions
png("plot1.png", width=480, height=480)

##plot
hist(mydata1$Global_active_power, col='red',xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()

