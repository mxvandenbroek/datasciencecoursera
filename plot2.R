
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
plot(data$Time, data$Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"
     , cex.axis = 0.7, cex.main =0.8, cex.lab = 0.7)

#copy the plot to a png
plotfilename = "Plot2.png"
dev.copy(png, plotfilename)
dev.off()

