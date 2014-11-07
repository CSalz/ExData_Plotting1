#
# plot2.png, data with load.R to data.frame tf
#
png(file = "plot2.png") ## Open the png device

with(tf,plot(tf$Global_active_power,type="l",lwd=2,
             xaxt= "n", main ="",xlab="", 
             ylab="Global Active Power (kilowatts)"))
axis(1,c(0,1500,2800), labels=c("Thu","Fri","Sat"))

dev.off()   ## Close the png device 