setwd("C:\\Users\\gherrera\\Desktop\\Por leer\\EDA")
library(tidyverse)
lista<-list.files()[[1]]
unzip(lista)
data<- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep =";", header = T)
nrow(data)
names(data)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dataf<-data %>% filter(Date=="2007-02-02" | Date=="2007-02-01")

#Plot 1
##Set file repository
setwd("C:\\Users\\gherrera\\Desktop\\Por leer\\EDA\\Plots")
## Create & Save plot 
plot1<-as.numeric(dataf$Global_active_power)
png("plot1.png")
hist(plot1, col="red", main="Global Active Power", xlab="Global Active Power (kilowats)")
dev.off()