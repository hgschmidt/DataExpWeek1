##This plots a lineplot of the SubMetering readings in the relevant days. 

##It assumes that "household_power_consumption.txt" has been downloaded, extracted, and stored in
##the working directory.

file <-  "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";")  #loads all the data

hpcsub <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")  # subsets the relevant dates

##Now the real plotting can begin

hpcsub$order <- 1:length(hpcsub$Global_active_power)

png("./plot3.png")

plot(as.numeric(hpcsub$order), as.numeric(hpcsub$Sub_metering_1), type ="l", xaxt ="n", yaxt = "n", xlab = "", ylab = "Energy Submetering", cex.lab = 0.75, lwd = 0.5)
lines(as.numeric(hpcsub$Sub_metering_2), col ="red", lwd = 0.5)
lines(as.numeric(hpcsub$Sub_metering_3), col ="blue", lwd = 0.5)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=c(0, 10, 20, 30), labels = c("0", "10", "20", "30"), cex.axis = 0.75)
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.5, lty = 1 )

dev.off()