# Clear the Global Environment
rm(list=ls())

# Get the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Electical power consumption.zip")

# Unzip the .zip archive
unzip("Electical power consumption.zip")

# Read data from the dates 2007-02-01 and 2007-02-02
dates <- c("1/2/2007", "2/2/2007")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.character(data$Date)
data <- data[data$Date %in% dates,]

# Concatenate Date and Time to a new string column
data$new <- paste(data$Date, data$Time)
data$new <- strptime(data$new, "%d/%m/%Y %H:%M:%S")

# Make plot2.png with a 480x480 frame
png("plot2.png", width=480, height=480)
plot(data$new, as.numeric(as.character(data$Global_active_power)), type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()