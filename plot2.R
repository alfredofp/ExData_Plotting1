
## The data is read
data <- read.table (file="./household_power_consumption.txt", header=T,
                    sep=";", stringsAsFactors=F, na.strings="?")

## only rows with date 2007-02-01 or 2007-02-02 are maintained
specificData <- data[(as.Date(data$Date, "%d/%m/%Y")== "2007-02-01") | 
                     (as.Date(data$Date, "%d/%m/%Y")== "2007-02-02"),]

## English format is set for the plotting, to display week days properly
Sys.setlocale("LC_TIME", "English")

## in order to have a proper axis value, DateTime values are obtained
## from the merge of Date and Time in a new column
specificData$DateTime <- strptime (paste (specificData$Date, specificData$Time),
                                   "%d/%m/%Y %H:%M:%S")

## plot into file png
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(specificData, plot (DateTime, Global_active_power, type ="l",
                         ylab="Global Active Power (kilowatts)", xlab=""))
## file is closed
dev.off()