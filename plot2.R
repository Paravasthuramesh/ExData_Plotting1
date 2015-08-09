## Project 1 - Create Plot2

## set working directory

setwd("C:/Users/Ramesh/Desktop/DataScience/ExploratoryDataAnalysis/Project1")

## Have the data file downloaded into the working directory

##Read the entire data set
full.data <- read.csv("household_power_consumption.txt",sep=";",na.strings="?")

##Extract the sub set
sub.data <- full.data[full.data$Date %in% c("1/2/2007","2/2/2007"),]

##Perform the data transformation
sub.data <- transform(
  sub.data,
  Date = as.Date(Date, format = "%d/%m/%Y"),
  Time = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

attach(sub.data)

## Basic settings 
par(ps=12, bg="transparent")

## Generate diagram for Plot2
plot(Time, Global_active_power,ylab="Global Active Power (Kilowatts)",xlab="", type="n")

lines(Time, Global_active_power)

detach(sub.data)

axis(1, at=c(1,(nrow(sub.data)/4),nrow(sub.data)/2), label=c("Thu","Fri","Sat"))

## create plot2 PNG file
dev.copy(png,file="plot2.png", width=480,height=480)

dev.off()