#
# used sqldf, as it works even on a Window VM, the alternative and also fast is to
# read data with read.table to a data frame and if restricted by memory subset
# data needed and release the original df, also attibutes need to be adjusted.
# f <- file("./household_power_consumption.txt")
# tf = read.table(f,header=TRUE, sep=";", colClasses = classes,comment.char = "" )
# tf = tf[tf2$Date %in% c("1/2/2007","2/2/2007"),]
#
# setup Connection
f <- file("./household_power_consumption.txt")

# read a few rows to get field names and attributes
rows= read.table(f,header= TRUE,sep=";", nrows = 5)

# set vector with name & attributes to use in table read 
classes = sapply(rows,class)

# alternative to read data, but it does not have the proper attributes.
library(sqldf)  #used to read and create data.frame and screen on dates

# refresh connection, it is closed on read.table
f <- file("./household_power_consumption.txt")

tf <- sqldf("select * from f where Date in('1/2/2007' ,'2/2/2007')  "
            ,dbname=tempfile(),
            file.format=list(header=T,sep=";",
                             row.names=F, colClasses = classes))

# convert to Date format
tf$Date = as.Date(tf$Date,format="%m/%d/%Y")
# release DB

sqldf()