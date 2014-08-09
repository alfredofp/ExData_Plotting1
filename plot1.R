
## The data is read
data <- read.table (file="./household_power_consumption.txt", header=T,
                     sep=";", stringsAsFactors=F, na.strings="?")

## only rows with date 2007-02-01 or 2007-02-02 are maintained
specificData <- data[(as.Date(data$Date, "%d/%m/%Y")== "2007-02-01") | 
                     (as.Date(data$Date, "%d/%m/%Y")== "2007-02-02"),]

## histogram into file png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(specificData$Global_active_power, col = "red",
     main="Global Active Power", xlab="Global Active Power (kilowatts)")
## file is closed
dev.off()