## Read in File
setwd("C:\\Users\\mdavie\\Desktop\\Coursera\\Exploratory Data Analysis") ##Set wherever file is saved
df <- read.table(".\\household_power_consumption.txt", header = TRUE, sep = ";") ## read in data

## Format Dates
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

## Subset data
df2 <- df[df$Date == "2007-02-01" | df$Date == "2007-02-02",]

## Add Column Classes
df2$Global_active_power <- as.numeric(levels(df2$Global_active_power))[df2$Global_active_power]
df2$Global_reactive_power <- as.numeric(levels(df2$Global_reactive_power))[df2$Global_reactive_power]
df2$Voltage <- as.numeric(levels(df2$Voltage))[df2$Voltage]
df2$Global_intensity <- as.numeric(levels(df2$Global_intensity))[df2$Global_intensity]
df2$Sub_metering_1 <- as.numeric(levels(df2$Sub_metering_1))[df2$Sub_metering_1]
df2$Sub_metering_2 <- as.numeric(levels(df2$Sub_metering_2))[df2$Sub_metering_2]

## Set mfrow
par(mfrow = c(1,1))

## Create Histogram
par(mfrow = c(1,1))
hist(df2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

## Save to PNG
dev.copy(png, "plot1.png")
dev.off()


