#read data
hpc <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?")
thp <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

#prepare dates
thp$DT <- strptime(paste(thp$Date, thp$Time), format="%d/%m/%Y %H:%M:%S")
thp$WD <- weekdays(thp$DT, abbreviate = T)

#plot data to file
png(filename="plot4.png",width = 480, height = 480)
par(mfrow=c(2,2))

#(1,1)
plot(thp$DT, thp$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#(1,2)
plot(thp$DT, thp$Voltage, type="l", xlab="datetime", ylab="Voltage")

#(2,1)
plot(thp$DT, thp$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(thp$DT, thp$Sub_metering_2, col="red")
lines(thp$DT, thp$Sub_metering_3, col="blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"), cex=0.8, bty="n" )

#(2,2)
plot(thp$DT, thp$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()