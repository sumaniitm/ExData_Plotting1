library(data.table)
hpc <- fread("household_power_consumption.txt")
hpc_sub <- hpc[which(hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007"),]
hpc_sub$Datetime <- as.POSIXct(paste(hpc_sub$Date, hpc_sub$Time), format = "%d/%m/%Y %H:%M:%S")
plot(hpc_sub$Datetime,hpc_sub$Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="",type="S")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()