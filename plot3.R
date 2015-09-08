require(readr)
epcNames <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
              "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
epc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = epcNames, skip = 66637, n_max = 2880)
epc$dateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot3.png")
plot(x = epc$dateTime, y = epc$Sub_metering_1, type = "l", col = "black",
     main = "", ylab = "Energy sub metering", xlab = "")
lines(x = epc$dateTime, y = epc$Sub_metering_2, type = "l", col = "red")
lines(x = epc$dateTime, y = epc$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 col = c("black", "red", "blue"), lty = c(1, 1, 1))
dev.off()
