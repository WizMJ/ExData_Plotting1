# Data loading and select data by date
consumption <-read.table("household_power_consumption.txt",header =TRUE, sep=";",colClasses="character")
consumption$Date <-as.Date(consumption$Date, format="%d/%m/%Y")
consumption.use <-subset(consumption, Date=="2007-02-01" | Date=="2007-02-02")
consumption.use$Global_active_power <-as.numeric(consumption.use$Global_active_power)

# Tranfrom weekday in Korean to in English
Sys.setlocale("LC_TIME", "English")
datetime <- paste(consumption.use$Date, consumption.use$Time)
consumption.use$Datetime <- as.POSIXct(datetime)

# Plot4: 2 x 2 plots
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## plot1
plot(consumption.use$Datetime,consumption.use$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab="")
## plot2
plot(consumption.use$Datetime, consumption.use$Voltage,type="l", xlab="datetime", ylab="Voltage")

## plot3
plot(Sub_metering_1~Datetime, data=consumption.use,type = "l",
     ylab = "Global Active Power (kilowatts)", xlab="")
lines(Sub_metering_2 ~Datetime, data=consumption.use, col = 'Red')
lines(Sub_metering_3 ~ Datetime, data=consumption.use, col = 'Blue')
legend("topright", col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lwd=1, bty ="n")

## plot4
plot(consumption.use$Datetime,consumption.use$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
