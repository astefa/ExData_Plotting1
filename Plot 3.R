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

png("plot3.png", width = 480, height = 480)

# initialize plot
plot(datetime, Sub_metering_1, pch=".", type = "n", xlab = "", 
     ylab = "Energy sub metering", ylim = c(0,40))

# add lines
lines(datetime, Sub_metering_1, lwd=0.5, pch = ".")
lines(datetime, Sub_metering_2, lwd=0.5, pch = ".", col = "Red")
lines(datetime, Sub_metering_3, lwd=0.5, pch = ".", col = "Blue")

# add descriptive legend
legend(x = "topright", 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
       lty = c(1,1,1), col = c("Black","Red","Blue"))

dev.off()
