# This R code file reads in the data, produces the desired plot,
# and exports it to a .png file.

# 1) Read in data

electric = read.table("household_power_consumption.txt", header = TRUE)

# 2) Convert dates and times into one new date and time variable

electric = transform(electric, 
                     datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# 3) Subset to include only the relevant dates

electricn = electric[66637:69516,]

# 4) Create a .png plot with the Energy Sub Metering series all shown over the two day period

png("plot4.png", width = 480, height = 480)

# make a 2 by 2 grid of plots
par(mfrow = c(2,2), mar = c(4,4,2,2))

# plot 2 copy in upper left
plot(datetime, Global_active_power, pch=".", type = "n", xlab = "", 
     ylab = "Global Active Power")
lines(datetime, Global_active_power, lwd=0.5, pch = ".")

# voltage plot in upper right
plot(datetime, Voltage, pch=".", type = "n", xlab = "datetime", 
     ylab = "Voltage")
lines(datetime, Voltage, lwd=0.5, pch = ".")

# initialize plot 3 copy in lower left with no legend border
plot(datetime, Sub_metering_1, pch=".", type = "n", xlab = "", 
     ylab = "Energy sub metering", ylim = c(0,40))
# add lines
lines(datetime, Sub_metering_1, lwd=0.5, pch = ".")
lines(datetime, Sub_metering_2, lwd=0.5, pch = ".", col = "Red")
lines(datetime, Sub_metering_3, lwd=0.5, pch = ".", col = "Blue")
# add descriptive legend with no border
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("Black","Red","Blue"), bty = "n")

# finish with a global reactive power plot in lower right
plot(datetime, Global_reactive_power, pch=".", type = "n")
lines(datetime, Global_reactive_power, lwd=0.5, pch = ".")

dev.off()
