dataset = read.csv("household_power_consumption.txt", 
                   sep=";", stringsAsFactors=FALSE, na.strings="?")
dataset$Date = strptime(dataset$Date, format="%d/%m/%Y")
dataset = dataset[dataset$Date >= strptime("2007-02-01", format="%Y-%m-%d") &
                    dataset$Date <= strptime("2007-02-02", 
                                             format="%Y-%m-%d"),]
dataset$datetime = strptime(paste(dataset$Date, dataset$Time), 
                            format="%Y-%m-%d %H:%M:%S")

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
with(dataset, plot(datetime,Global_active_power, 
                   type="l", 
                   main="", xlab="",
                   ylab="Global Active Power"))
with(dataset, plot(datetime,Voltage, 
                   type="l", 
                   main=""))
plot(dataset$datetime, dataset$Sub_metering_1, type="n",
     main="", xlab="",
     ylab="Energy sub metering")
points(dataset$datetime, dataset$Sub_metering_1, type="l")
points(dataset$datetime, dataset$Sub_metering_2, type="l", col="red")
points(dataset$datetime, dataset$Sub_metering_3, type="l", col="blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","red","blue"), lty = 1, bty = "n") #no border
with(dataset, plot(datetime,Global_reactive_power, 
                   type="l", 
                   main=""))
dev.off()

par(mfrow = c(1,1))