setwd("C:\\Users\\gherrera\\Desktop\\Por leer\\EDA")
library(tidyverse)
lista<-list.files()[[1]]
unzip(lista)
data<- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep =";", header = T)
nrow(data)
names(data)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dataf<-data %>% filter(Date=="2007-02-02" | Date=="2007-02-01")

#Plot 4
plot4<-dataf %>% select(Global_reactive_power,Voltage, Date, Time)
plot4$Date_Time<-NA
plot4$Date_Time<-as.POSIXct(paste(plot4$Date, plot4$Time), format="%Y-%m-%d %H:%M:%S")
png("plot4.png")
par(mfrow=c(2,2), mai=c(0.3,0.3,0.1,0.3))
plot(xlab = '', x=plot2$Date_Time ,y=plot2$Global_active_power, type="l",ylab="Global Active Power")
plot(x=plot4$Date_Time ,y=plot4$Voltage, type="l",xlab="datetime", ylab="Voltage")
plot(x=plot3$Date_Time ,y=plot3$Sub_metering_1, type="l",ylab="Energy sub metering", xlab="")
lines(x=plot3$Date_Time,y=plot3$Sub_metering_2, col="red")
lines(x=plot3$Date_Time,y=plot3$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"),lty=1)
plot(x=plot4$Date_Time ,y=plot4$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
dev.off()