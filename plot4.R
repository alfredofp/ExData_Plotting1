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
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))

## position 1,1
with(specificData, plot(DateTime, Global_active_power, xlab="",
                        ylab="Global Active Power", type ="l"))

## position 1,2
with(specificData, plot(DateTime, Voltage, xlab="datetime",
                        ylab="Voltage", type ="l"))
     
## position 2,1
with(specificData, plot(DateTime, Sub_metering_1, type = "l",
                        ylab="Energy sub metering", xlab=""))
with(specificData, points(DateTime, Sub_metering_2,col="red", type ="l"))        
with(specificData, points(DateTime, Sub_metering_3,col="blue", type ="l"))

legend("topright", lty=1, lwd=1, col = c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       cex = 0.9)

## position 2,2
with(specificData, plot(DateTime, Global_reactive_power, xlab="datetime",
                        type ="l"))
     

## file is closed
dev.off()