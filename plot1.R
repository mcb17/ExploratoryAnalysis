data <- read.table("household.txt", sep = ";")

# rename column names
colnames(data) <- as.character(unlist(data[1,]))
data = data[-1,]

# extract data with date between 2007-02-01 and 2007-02-02

dateStart <- "2007-02-01"
dateEnd <- "2007-02-02"

data$Date <- as.Date(strptime((data$Date), format = "%d/%m/%Y")) 

data2 <- subset(data, data$Date <= dateEnd & data$Date >= dateStart)

# First plot

png(filename = "plot1.png",
    width = 480, height = 480)

hist(as.numeric(as.character(data2$Global_active_power)), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")

dev.off()