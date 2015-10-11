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

## Plot3
par(mfrow=c(1,1))
with(target_data, {
  plot(Sub_metering_1~DateTime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~DateTime,col='Red')
  lines(Sub_metering_3~DateTime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"),lty=1, lwd=2,bty="o", cex=0.7,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()