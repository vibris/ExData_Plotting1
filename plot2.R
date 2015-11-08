#read data
hpc <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?")
thp <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

#prepare dates
thp$DT <- strptime(paste(thp$Date, thp$Time), format="%d/%m/%Y %H:%M:%S")
thp$WD <- weekdays(thp$DT, abbreviate = T)

#plot data to file
png(filename="plot2.png",width = 480, height = 480)
plot(thp$DT, thp$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()