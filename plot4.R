#
# Global Active Power
#

png(file = "plot4.png") ## Open the png device


par(mfrow=c(2,2))
with(tf,plot(tf$Global_active_power,type="l",lwd=2,
             xaxt= "n", main ="",xlab="", 
             ylab="Global Active Power"))
axis(1,c(0,1500,2900), labels=c("Thu","Fri","Sat"))

#
# Voltage
#
with(tf,plot(tf$Voltage,type="l",lwd=2,
             xaxt= "n", main ="",xlab="datetime", 
             ylab="Voltage"))
axis(1,c(0,1500,2900), labels=c("Thu","Fri","Sat"))

#
# Submetering
#
SubNameList = names(tf[,7:9])
with(tf,plot(tf$Sub_metering_1,type="l",lwd=2,
             xaxt= "n", main ="",xlab="",col="black", 
             ylab="Energy sub metering"))
lines(tf$Sub_metering_2,col="red")
lines(tf$Sub_metering_3,col="blue")	
legend("topright",pch = c("___") ,col=c("black","red","blue"),
       cex = 1,xjust=1, border="",legend=SubNameList)
axis(1,c(0,1500,2900), labels=c("Thu","Fri","Sat"))

#
# Global reactive power
#
with(tf,plot(tf$Global_reactive_power,type="l",lwd=2,
             xaxt= "n", main ="",xlab="datetime", 
             ylab="Global_reactive_power"))
axis(1,c(0,1500,2900), labels=c("Thu","Fri","Sat"))
png("plot4.png")
par(mfrow=c(1,1))

dev.off()   ## Close the png device 
