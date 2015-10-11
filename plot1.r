## Set the work dictionary
setwd("/Users/QinqingLiu/Documents/R/coursera/EDA")

## Get the whole data
whole_data<-read.table("./data/household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",dec=".")

## Subset Original data
whole_data$Date <- as.Date(whole_data$Date, format="%d/%m/%Y")
target_data<-subset(whole_data, subset=(Date>="2007-02-01"&Date<="2007-02-02"))

Global_Active_Power<-as.numeric(target_data$Global_active_power)

## Plot1
hist(Global_Active_Power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()




