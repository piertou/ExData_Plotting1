require(readr)
epcNames <- names(read_delim("household_power_consumption.txt", delim = ";", col_names = TRUE, n_max = 0))
epc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = epcNames, skip = 66637, n_max = 2880)
epc$dateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")
def.par <- par(no.readonly = TRUE) # save default, for resetting...
par(mfrow=c(2,2))  # 2 columns, 2 rows, by row

with(epc, plot(x = dateTime, y = Global_active_power, type = "l", col = "black",
               main = "", ylab = "Global Active Power (kilowatts)", xlab = ""))

with(epc, plot(x = dateTime, y = Voltage, type = "l", col = "black",
               main = "", ylab = "Voltage", xlab = "datetime"))

plot(x = epc$dateTime, y = epc$Sub_metering_1, type = "l", col = "black",
     main = "", ylab = "Energy sub metering", xlab = "")
lines(x = epc$dateTime, y = epc$Sub_metering_2, type = "l", col = "red")
lines(x = epc$dateTime, y = epc$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                 col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = "n")

with(epc, plot(x = dateTime, y = Global_reactive_power, type = "l", col = "black",
               main = "", ylab = "Global_reactive_power", xlab = "datetime"))

par(def.par)  # restore default
dev.off()
