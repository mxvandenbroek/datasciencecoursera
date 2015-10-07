
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
plot(data$Time, data$Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)
points(data$Time, data$Sub_metering_1, col="black", type = "l")
points(data$Time, data$Sub_metering_2, col="red",  type = "l")
points(data$Time, data$Sub_metering_3, col="blue",  type = "l")
leg <- paste0("Sub_metering_",1:3)
legend("topright", lty= 1 , col = c("black", "red", "blue"), legend = leg, cex=0.7, y.intersp = 0.7)

#copy the plot to a png
plotfilename = "Plot3.png"
dev.copy(png, plotfilename)
dev.off()

