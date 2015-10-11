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

## Preprogress
DateTime <- paste(as.Date(target_data$Date), target_data$Time)
target_data$DateTime <- as.POSIXct(DateTime)
  
## Plot2
plot(target_data$DateTime,Global_Active_Power,type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


# 
# 
# ## Getting full dataset
# data_full <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
#                       nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")
# 
# ## Subsetting the data
# data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
# rm(data_full)
# 
# ## Converting dates
# datetime <- paste(as.Date(data$Date), data$Time)
# data$Datetime <- as.POSIXct(datetime)
# 
# ## Plot 1
#hist(data$Global_active_power, main="Global Active Power", 
#      xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
# 
# ## Saving to file
# dev.copy(png, file="plot1.png", height=480, width=480)
# dev.off()

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()