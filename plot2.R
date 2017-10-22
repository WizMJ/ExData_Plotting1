setwd("./coursera/exploratory_data_analysis")

# Data loading and select data by date
consumption <-read.table("household_power_consumption.txt",header =TRUE, sep=";",colClasses="character")
consumption$Date <-as.Date(consumption$Date, format="%d/%m/%Y")
consumption.use <-subset(consumption, Date=="2007-02-01" | Date=="2007-02-02")
consumption.use$Global_active_power <-as.numeric(consumption.use$Global_active_power)

# Tranfrom weekday in Korean to in English
Sys.setlocale("LC_TIME", "English")
datetime <- paste(consumption.use$Date, consumption.use$Time)
consumption.use$Datetime <- as.POSIXct(datetime)

# Plot2: Line plot
png("plot2.png", width=480, height=480)
plot(consumption.use$Datetime,consumption.use$Global_active_power, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()