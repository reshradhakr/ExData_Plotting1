# reading the household power consumption dataset
data_full <- read.csv("./household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote="\"")
# storing all the dates in the d/m/y format
data_full$Date <- as.Date(data_full$Date, format = "%d/%m/%Y")
#getting a subset of data between "2007/02/01" and "2007/02/02"
data  <- subset(data_full, subset=(Date >= "2007/02/01" & Date <= "2007/02/02"))
#remove the entire dataset that we stored.
rm(data_full)
## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
#Constructing Plot 2
plot(data$Global_active_power~data$Datetime, ylab="Global Active Power (kilowatts)", xlab="", type="l")
#create a png file
dev.copy(png, file="plot2.png", width=480, height=480)
#Close the device
dev.off()