# This R code file reads in the data, produces the desired plot,
# and exports it to a .png file.

# 1) Read in data

setwd("C:\\Users\\Andrei\\Documents\\Data Science Specialization\\Exploratory Data Analysis\\Project 1")
electric = read.table("household_power_consumption.txt", header = TRUE)

# 2) Convert dates and times

NewTime = strptime(Time,format = "%H:%M:%S")
NewDate = as.Date(Date,format = "%d/%m/%Y")
electric = cbind(electric,NewDate,NewTime)

# 3) Subset to include only the relevant dates

electricn = electric[66637:69516,]

# 4) Global active power frequency plot with labels and options written to
#    .png file

png("plot1.png", width = 480, height = 480)
hist(Global_active_power, main = "Global Active Power", col = "Red", 
     xlab = "Global Active Power (kilowatts)")
dev.off()