# Read the data file
taball <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

# Subset the data
tab2day <- subset(taball, Date == "1/2/2007"| Date == "2/2/2007")

# Create a datetime column in the data frame
tab2day$datetime <- strptime(paste(tab2day$Date, tab2day$Time), format="%d/%m/%Y %H:%M:%S")

# Initiate the PNG device
png(filename="plot2.png", width = 480, height = 480)

# Define a function to convert factor levels to numeric
as.numeric.factor <- function(x) {as.numeric(levels(x))[x]} 
tab2day$Global_active_power <- as.numeric.factor(tab2day$Global_active_power)

# Create the line plot
with(tab2day, plot(datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (in kilowatts)"))

dev.off()