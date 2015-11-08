#read data
hpc <- read.table("household_power_consumption.txt", header=T, sep=";",na.strings="?")
thp <- subset(hpc, Date=="1/2/2007" | Date=="2/2/2007")

#plot data to file
png(filename="plot1.png",width = 480, height = 480)
hist(thp$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()