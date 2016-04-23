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
#Constructing Plot 3
plot(data$Sub_metering_1~data$Datetime, ylab="Energy sub metering", xlab="", type="l")
#Drawing lines
lines(data$Sub_metering_2~data$Datetime,col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")
#Drawing legends
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7)
#create a png file
dev.copy(png, file="plot3.png", width=480, height=480)
#Close the device
dev.off()