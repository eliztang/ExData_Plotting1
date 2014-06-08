dataset = read.csv("household_power_consumption.txt", 
                   sep=";", stringsAsFactors=FALSE, na.strings="?")
dataset$Date = strptime(dataset$Date, format="%d/%m/%Y")
dataset = dataset[dataset$Date >= strptime("2007-02-01", format="%Y-%m-%d") &
                    dataset$Date <= strptime("2007-02-02", 
                                             format="%Y-%m-%d"),]
dataset$datetime = strptime(paste(dataset$Date, dataset$Time), 
                            format="%Y-%m-%d %H:%M:%S")

png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(dataset$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power") 
dev.off()