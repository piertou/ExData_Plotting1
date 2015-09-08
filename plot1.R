require(readr)
epcNames <- names(read_delim("household_power_consumption.txt", delim = ";", col_names = TRUE, n_max = 0))
epc <- read_delim("household_power_consumption.txt", delim = ";", na = "?", 
                col_names = epcNames, skip = 66637, n_max = 2880)
epc$dateTime <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png")
hist(epc$Global_active_power, freq = TRUE, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
