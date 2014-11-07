#
# plot1.png, data with load.R to data.frame tf
#
png(file = "plot1.png") ## Open the png device

with(tf,hist(as.numeric(tf$Global_active_power),
             col="red", main ="Global Active Power", 
             xlab="Global Active Power (kilowatts)"))

dev.off()   ## Close the png device 