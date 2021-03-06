# Read the data file
taball <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Subset the data
tab2day <- subset(taball, Date == "1/2/2007"| Date == "2/2/2007")

# Create a datetime column in the data frame
tab2day$datetime <- strptime(paste(tab2day$Date, tab2day$Time), format="%d/%m/%Y %H:%M:%S")

# Initiate the PNG device
png(filename="plot3.png", width = 480, height = 480)

# Define a function to convert factor levels to numeric
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]} 
tab2day$Global_active_power <- as.numeric.factor(tab2day$Global_active_power)
tab2day$Sub_metering_1 <- as.numeric.factor(tab2day$Sub_metering_1)
tab2day$Sub_metering_2 <- as.numeric.factor(tab2day$Sub_metering_2)

# Create the plot
with(tab2day, plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
with(tab2day, lines(datetime, Sub_metering_2, col="red"))
with(tab2day, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
