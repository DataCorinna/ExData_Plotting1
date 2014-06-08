#Activate sqldf-package:
#library(sqldf)

#Set filename:
#file<-"household_power_consumption.txt"

#Set SQL query-expression for selecting specific dates:
#SQL<-"SELECT * FROM file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"

#Read file according to SQL query-expression:
#DF<-read.csv.sql(file,sep=";",sql = SQL)

#Create a single column containing date AND time as a string:
#DF[,1]<-paste(DF[,1],DF[,2])

#Convert date/time column from string to POSIXct:
#DF[,1]<-as.POSIXct(strptime(DF$Date,"%d/%m/%Y %H:%M:%S"))

#Open graphics device:
png(filename = "plot4.png",width = 480, height = 480, units = "px", pointsize = 12)

#Set plotting parameters:
par(mfrow=c(2,2))

#First plot:
plot(DF$Date,DF$Global_active_power,type="l",xlab="",ylab="Global Active Power")

#Second plot:
plot(DF$Date,DF$Voltage,type="l",xlab="datetime",ylab="Voltage")

#Third plot:
plot(DF$Date,DF$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
points(DF$Date,DF$Sub_metering_2,col="red",type="l")
points(DF$Date,DF$Sub_metering_3,col="blue",type="l")
legend("topright", lwd=1,bty="n", col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Fourth plot:
plot(DF$Date,DF$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

#Close graphics device:
dev.off()

