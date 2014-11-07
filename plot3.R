#
# plot3.png, data with load.R to data.frame tf
#
png(file = "plot3.png") ## Open the png device

SubNameList = names(tf[,7:9])
with(tf,plot(tf$Sub_metering_1,type="l",lwd=2,
             xaxt= "n", main ="",xlab="",col="black", 
             ylab="Energy sub metering"))
lines(tf$Sub_metering_2,col="red")
lines(tf$Sub_metering_3,col="blue")	
legend("topright",pch = c("___") ,col=c("black","red","blue"),legend=SubNameList)
axis(1,c(0,1500,2900), labels=c("Thu","Fri","Sat"))

dev.off()   ## Close the png device 