#Activate sqldf-package:
library(sqldf)

#Set filename:
file<-"household_power_consumption.txt"

#Set SQL query-expression for selecting specific dates:
SQL<-"SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

#Read file according to SQL query-expression:
DF<-read.csv.sql(file,sep=";",sql = SQL)

#Create a single column containing date AND time as a string:
DF[,1]<-paste(DF[,1],DF[,2])

#Convert date/time column from string to POSIXct:
DF[,1]<-as.POSIXct(strptime(DF$Date,"%d/%m/%Y %H:%M:%S"))

#Open graphics device:
png(filename = "plot1.png",width = 480, height = 480, units = "px", pointsize = 12)

#Plot Data:
hist(DF$Global_active_power,breaks=12,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")

#Close graphics device:
dev.off()
