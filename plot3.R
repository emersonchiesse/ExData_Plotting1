url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(url, destfile="power.zip", method="wget")
#unzip("power.zip")
#data<-read.table("household_power_consumption.txt", sep=";",header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric"), na.strings="?")

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

data = subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot3.png", width = 480, height = 480)
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()