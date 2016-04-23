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
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#Combining all plots
#Constructing Plot 1
plot(data$Global_active_power ~ data$Datetime, ylab="Global Active Power", type="l", xlab="")
#Constructing Plot 2
plot(data$Voltage ~ data$Datetime, ylab="Voltage", type="l", xlab="datetime")
#Constructing Plot 3
plot(data$Sub_metering_1~data$Datetime, ylab="Engergy sub metering", xlab="", type="l")
lines(data$Sub_metering_2~data$Datetime, col="Red")
lines(data$Sub_metering_3~data$Datetime, col="Blue")
legend("topright", legend=c("Sub_metering_1   ", "Sub_metering_2   ", "Sub_metering_3   "), col=c("Black", "Red", "Blue"), lty=1, lwd=2, cex = 0.7, bty="n")
#Constructing Plot 4
plot(data$Global_reactive_power~data$Datetime, type="l", ylab="Global Reactive Power", xlab="datetime")
#create a png file
dev.copy(png, file="plot4.png", height=480, width=480)
#Close the device
dev.off()