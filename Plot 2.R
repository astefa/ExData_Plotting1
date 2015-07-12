# This R code file reads in the data, produces the desired plot,
# and exports it to a .png file.

# 1) Read in data

electric = read.table("household_power_consumption.txt", header = TRUE)

# 2) Convert dates and times into one new date and time variable

electric = transform(electric, 
                     datetime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

# 3) Subset to include only the relevant dates

electricn = electric[66637:69516,]

# 4) Create a .png line plot of global active power over the two days in question

png("plot2.png", width = 480, height = 480)
plot(datetime, Global_active_power, pch=".", type = "n", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
lines(datetime, Global_active_power, lwd=0.5, pch = ".")
dev.off()
