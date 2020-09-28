setwd("C:\\Users\\gherrera\\Desktop\\Por leer\\EDA")
library(tidyverse)
lista<-list.files()[[1]]
unzip(lista)
data<- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep =";", header = T)
nrow(data)
names(data)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dataf<-data %>% filter(Date=="2007-02-02" | Date=="2007-02-01")

#Plot 3
plot3<-dataf %>% select(Sub_metering_1,Sub_metering_2, Sub_metering_3, Date,Time)
plot3$Date_Time<-NA
plot3$Date_Time<-as.POSIXct(paste(plot3$Date, plot3$Time), format="%Y-%m-%d %H:%M:%S")
png("plot3.png")
plot(x=plot3$Date_Time ,y=plot3$Sub_metering_1, type="l",xlab="",ylab="Energy sub metering")
lines(x=plot3$Date_Time,y=plot3$Sub_metering_2, col="red")
lines(x=plot3$Date_Time,y=plot3$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black","red", "blue"),lty=1)
dev.off()