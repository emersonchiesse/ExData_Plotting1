url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="power.zip", method="wget")
unzip("power.zip")
data<-read.table("household_power_consumption.txt", sep=";",header=T, colClasses=c("character", "character", "numeric", "numeric", "numeric"), na.strings="?")
d=data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
