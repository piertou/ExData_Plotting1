require(readr)
epcNames <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
              "Sub_metering_1", "Sub_metering_3", "Sub_metering_3")
epc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = epcNames, skip = 66637, n_max = 2880)
epc$dateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
dev.new("RStudioGD")
with(epc, plot(x = dateTime, y = Global_active_power, type = "l", col = "black",
     main = "", ylab = "Global Active Power (kilowatts)", xlab = ""))
dev.copy(device = png, filename = 'plot2.png', width = 480, height = 480) 
dev.off()
