##This plots 4 ploys within one plot space. 

##It assumes that "household_power_consumption.txt" has been downloaded, extracted, and stored in
##the working directory.

file <-  "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";")  #loads all the data

hpcsub <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")  # subsets the relevant dates

##Now the real plotting can begin

hpcsub$order <- 1:length(hpcsub$Global_active_power)

png("./plotR.png")

par(mfrow=c(2,2))  #specifying a 2 x 2 plotting area


plot(hpcsub$order, as.numeric(hpcsub$Global_active_power), type="l",  xaxt='n', yaxt = 'n', xlab = "", ylab ="Global Active Power (kilowats)", cex.lab = 0.75)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=c(0, 1000, 2000, 3000), labels = c("0", "2", "4", "6"), cex.axis = 0.75)

plot( hpcsub$order, as.numeric(hpcsub$Voltage), type = "l", xaxt = 'n', yaxt = 'n', xlab = "", ylab ="Voltage ", cex.lab = 0.75)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=seq(813, 1971, 193), labels = c("234", "", "238", "", "242", "", "246"), cex.axis = 0.5)


plot(as.numeric(hpcsub$order), as.numeric(hpcsub$Sub_metering_1), type ="l", xaxt ="n", yaxt = "n", xlab = "", ylab = "Energy Submetering", cex.lab = 0.75, lwd = 0.5)
lines(as.numeric(hpcsub$Sub_metering_2), col ="red", lwd = 0.5)
lines(as.numeric(hpcsub$Sub_metering_3), col ="blue", lwd = 0.5)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=c(0, 10, 20, 30), labels = c("0", "10", "20", "30"), cex.axis = 0.75)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.5, lty = 1 )

plot(hpcsub$order, as.numeric(hpcsub$Global_reactive_power), type = "l", xaxt = "n", yaxt = "n", xlab ="datetime", ylab ="Global_reactive_power", cex.lab=0.75)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=seq(2,230,45.6), labels = c("0", "0.1", "0.2", "0.3", "0.4", "0.5"), cex.axis = 0.4)

dev.off()