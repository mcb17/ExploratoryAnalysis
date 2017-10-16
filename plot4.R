data <- read.table("household.txt", sep = ";")

# rename column names
colnames(data) <- as.character(unlist(data[1,]))
data = data[-1,]

# extract data with date between 2007-02-01 and 2007-02-02

dateStart <- "2007-02-01"
dateEnd <- "2007-02-02"

data$Date <- as.Date(strptime((data$Date), format = "%d/%m/%Y")) 


data2 <- subset(data, data$Date <= dateEnd & data$Date >= dateStart)
data2$newtime <- as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S")

# Save plot

png(filename = "plot4.png",
    width = 480, height = 480)

par(mfrow=c(2,2))

# Fist plot 

plot(data2$newtime , 
     as.numeric(as.character(data2$Global_active_power)), 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatt")

# Second plot

plot(data2$newtime ,
     as.numeric(as.character(data2$Voltage)),
     type = "l",
     xlab = "datetime",
     ylab = "Voltage" )

# Third plot

plot(data2$newtime , 
     as.numeric(as.character(data2$Sub_metering_1)), 
     type = "l", 
     xlab = "", 
     ylab = "Energy Sub metering")
lines(data2$newtime, as.character(data2$Sub_metering_2), col = "red")
lines(data2$newtime, as.character(data2$Sub_metering_3), col = "blue")

legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty = 1:1, cex = 0.8)


# Fourth plot

plot(data2$newtime ,
     as.numeric(as.character(data2$Global_reactive_power)),
     type = "l",
     xlab = "datetime",
     ylab = "Global reactive power",
     ylim = c(0,0.5))

dev.off()