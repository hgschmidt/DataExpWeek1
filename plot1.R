##This plots a histogram of global active power in the relevant days. 

##It assumes that "household_power_consumption.txt" has been downloaded, extracted, and stored in
##the working directory.

file <-  "household_power_consumption.txt"

hpc <- read.table(file, header = TRUE, sep = ";")  #loads all the data

hpcsub <- subset(hpc, hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007")  # subsets the relevant dates


##Now the real plotting can begin

png("plot1.png")



hist(as.numeric(hpcsub$Global_active_power), col="red", xaxt = 'n', yaxt = 'n', xlab="Global Active Power (kilowats)", ylab = "Frequency", cex.lab = 0.6, main = "Global Active Power", cex.main = 0.6)
axis(1, at=c(0,1000, 2000, 3000), labels = c("0", "2", "4", "6"), cex.axis = 0.6)
axis(2, at= c(0, 200, 400, 600, 800, 1000, 1200), labels = c("0", "200", "400", "600", "800", "1000", "1200"), cex.axis=0.6)

dev.off()
#Ta-dah!