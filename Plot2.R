setwd("C:\\Users\\gherrera\\Desktop\\Por leer\\EDA")
library(tidyverse)
lista<-list.files()[[1]]
unzip(lista)
data<- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep =";", header = T)
nrow(data)
names(data)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dataf<-data %>% filter(Date=="2007-02-02" | Date=="2007-02-01")

#plot 2
plot2<-dataf %>% select(Global_active_power,Date,Time)
head(plot2)
plot2$Date_Time<-NA
plot2$Date_Time<-as.POSIXct(paste(plot2$Date, plot2$Time), format="%Y-%m-%d %H:%M:%S")
png("plot2.png")
plot(x=plot2$Date_Time ,y=plot2$Global_active_power, type="l",xlab="",ylab="Global Active Power (kilowats)")
dev.off()