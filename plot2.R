dataset = read.csv("household_power_consumption.txt", 
                   sep=";", stringsAsFactors=FALSE, na.strings="?")
dataset$Date = strptime(dataset$Date, format="%d/%m/%Y")
dataset = dataset[dataset$Date >= strptime("2007-02-01", format="%Y-%m-%d") &
                    dataset$Date <= strptime("2007-02-02", 
                                             format="%Y-%m-%d"),]
dataset$datetime = strptime(paste(dataset$Date, dataset$Time), 
                            format="%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(dataset, plot(datetime,Global_active_power, 
                   type="l", 
                   main="", xlab="",
                   ylab="Global Active Power (kilowatts)"))
dev.off()