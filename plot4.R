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

## Create DateTime Variable and convert to Posixlt
df2$DateTime <- paste(df2$Date, df2$Time, sep = " ")
df2$DateTime <- strptime(df2$DateTime, format = "%Y-%m-%d %H:%M:%S")

## Set mfrow
par(mfrow = c(2,2))

## Top Left
with(df2, plot(DateTime, Global_active_power, xlab = "", ylab = "Global Active Power", type = "n"))
lines(df2$DateTime, df2$Global_active_power)

## Top Right
with(df2, plot(DateTime, Voltage, xlab = "datetime",  ylab = "Voltage", type = "n"))
lines(df2$DateTime, df2$Voltage)

## Bottom Left
with(df2, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
lines(df2$DateTime, df2$Sub_metering_1)
lines(df2$DateTime, df2$Sub_metering_2, col = "red")
lines(df2$DateTime, df2$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1), col = c("black", "red", "blue"))

## Bottom Right
with(df2, plot(DateTime, Global_reactive_power, xlab = "datetime",  ylab = "Global_reactive_power", type = "n"))
lines(df2$DateTime, df2$Global_reactive_power)

## Save to PNG
dev.copy(png, "plot1.png")
dev.off()
