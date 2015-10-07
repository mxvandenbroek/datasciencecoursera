
path <- "C:\\Users\\MarkPetra\\SkyDrive\\Documents\\Data science\\JHU Data science specialization\\Course Exploratory Data Analysis"
setwd(path)

#IMPORTANT: it is required to have the data file in the current working directory

filename <- "household_power_consumption.txt"

#loading the data
fulldata <- read.csv(filename, sep=";", stringsAsFactors = F, na.strings = "?")

#converting the date and time fields
temp <- paste(fulldata$Date, fulldata$Time)
fulldata$Time <- strptime(temp, format = "%d/%m/%Y %H:%M:%S" )
fulldata$Date <- as.Date(fulldata$Date, format = "%d/%m/%Y")

#selecting the data from 1st and 2nd of February 2007
date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")
data <- fulldata[(fulldata$Date == date1) | (fulldata$Date == date2) ,]

#construct the plot:
defpar <- par() #to store current par settings
par(mfrow = c(2,2))

#make subplot 1
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab="Global Active Power"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)

#make subplot 2
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab="Voltage"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)

#make subplot 3
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)
points(data$Time, data$Sub_metering_1, col="black", type = "l")
points(data$Time, data$Sub_metering_2, col="red",  type = "l")
points(data$Time, data$Sub_metering_3, col="blue",  type = "l")
leg <- paste0("Sub_metering_",1:3)
legend("topright", lty= 1 , col = c("black", "red", "blue"), legend = leg, cex=0.7, bty = "n")

#make subplot 4
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab="Global_reactive_power"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)


par(defpar)

#copy the plot to a png
plotfilename = "Plot4.png"
dev.copy(png, plotfilename)
dev.off()

