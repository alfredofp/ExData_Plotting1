## English format is set for the plotting, to display week days properly
Sys.setlocale("LC_TIME", "English")


## The data is read
data <- read.table (file="./household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?")

## only rows with date 2007-02-01 or 2007-02-02 are maintained
specificData <- data[(as.Date(data$Date, "%d/%m/%Y")== "2007-02-01") | 
                             (as.Date(data$Date, "%d/%m/%Y")== "2007-02-02"),]

## in order to have a proper axis value, DateTime values are obtained
## from the merge of Date and Time in a new column
specificData$DateTime <- strptime (paste (specificData$Date, specificData$Time),
                                   "%d/%m/%Y %H:%M:%S")

## plot into file png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(specificData, plot(DateTime, Sub_metering_1, type = "l",
                        ylab="Energy sub metering", xlab=""))
with(specificData, points(DateTime, Sub_metering_2,col="red", type ="l"))        
with(specificData, points(DateTime, Sub_metering_3,col="blue", type ="l"))

legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## file is closed
dev.off()