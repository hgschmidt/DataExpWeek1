##This plots a lineplot of global active power in the relevant days. 

##It assumes that "household_power_consumption.txt" has been downloaded, extracted, and stored in
##the working directory.

file <-  "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";")  #loads all the data

hpcsub <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")  # subsets the relevant dates

##Now the real plotting can begin

hpcsub$order <- 1:length(hpcsub$Global_active_power)

png("./plot2.png")

plot(hpcsub$order, as.numeric(hpcsub$Global_active_power), type="l",  xaxt='n', yaxt = 'n', xlab = "", ylab ="Global Active Power (kilowats)", cex.lab = 0.75)
axis(1, at=c(0,1500, 2900), labels = c("Thu", "Fri", "Sat"), ann= FALSE, cex.axis = 0.75)
axis(2, at=c(0, 1000, 2000, 3000), labels = c("0", "2", "4", "6"), cex.axis = 0.75)
dev.off()