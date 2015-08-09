## Project 1 - Create Plot1


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

## Basic settings 
par(ps=12, bg="transparent")

## Generate diagram
hist(sub.data$Global_active_power,col="red",xlab="Global Active Power (Kilowatts)",ylab= "Frequency", main="Global Active Power")

## Output diagram
dev.copy(png,file="plot1.png", width=480,height=480)

dev.off()