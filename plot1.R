require(readr)
epcNames <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
              "Sub_metering_1", "Sub_metering_3", "Sub_metering_3")
epc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = epcNames, skip = 66637, n_max = 2880)
epc$dateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png")
hist(epc$Global_active_power, freq = TRUE, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off
