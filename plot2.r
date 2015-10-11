## Set the work dictionary
setwd("/Users/QinqingLiu/Documents/R/coursera/EDA")

## Get the whole data
whole_data<-read.table("./data/household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",dec=".")

## Subset Original data
whole_data$Date <- as.Date(whole_data$Date, format="%d/%m/%Y")
target_data<-subset(whole_data, subset=(Date>="2007-02-01"&Date<="2007-02-02"))
Global_Active_Power<-as.numeric(target_data$Global_active_power)

## Preprogress: Combine the date and time
DateTime <- paste(as.Date(target_data$Date), target_data$Time)
target_data$DateTime <- as.POSIXct(DateTime)

## Plot2
plot(target_data$DateTime,Global_Active_Power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


