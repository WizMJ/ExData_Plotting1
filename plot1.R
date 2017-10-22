# Memory calculaton
# since data consits of 2,075,259 rows and 9 columns, 
# the required memory is calculated as follows:
no.row <-2075259; no.col <-9
Mbytes <-no.row*no.col*8/2^20
# return value says that 142MB of memory is required to load

# Data loading and select data by date
consumption <-read.table("household_power_consumption.txt",header =TRUE, sep=";",colClasses="character")
consumption$Date <-as.Date(consumption$Date, format="%d/%m/%Y")
consumption.use <-subset(consumption, Date=="2007-02-01" | Date=="2007-02-02")
consumption.use$Global_active_power <-as.numeric(consumption.use$Global_active_power)

# Tranfrom weekday in Korean to in English
Sys.setlocale("LC_TIME", "English")
datetime <- paste(consumption.use$Date, consumption.use$Time)
consumption.use$Datetime <- as.POSIXct(datetime)

# Plot1: Histogram
png("plot1.png", width=480, height=480)
hist(as.numeric(consumption.use$Global_active_power),col="red", 
     xlab ="Global Active Power (kilowatts)", ylab ="Frequency", main ="Global Active Power")
dev.off()
