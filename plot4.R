library(data.table)
hpc <- fread("household_power_consumption.txt")
hpc_sub <- hpc[which(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"),]
hpc_sub$Datetime <- as.POSIXct(paste(hpc_sub$Date, hpc_sub$Time), format = "%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
plot(hpc_sub$Datetime,hpc_sub$Global_active_power,ylab="Global Active Power",xlab="",type="S")
plot(hpc_sub$Datetime,hpc_sub$Voltage,ylab="Voltage",xlab="datetime",type="S")
plot(hpc_sub$Datetime,hpc_sub$Sub_metering_1,ylab="Energy sub metering",xlab="",type="S",col="black")
lines(hpc_sub$Datetime,hpc_sub$Sub_metering_2,col="red")
lines(hpc_sub$Datetime,hpc_sub$Sub_metering_3,col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
plot(hpc_sub$Datetime,hpc_sub$Global_reactive_power,ylab="Global_reactive_power",xlab="datetime",type="S")
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()