## plot2.R
## https://github.com/avgxm/ExData_Plotting1
## 2015-01-09
## exdata-010 - assignment 1
## Read Individual household electric power consumption Data Set from the 
## UC Irvine Machine Learning Repository and make a plot of Global Active Power 
## for selected date range

#settings
start.ts <- "2007-02-01 00:00:00"
end.ts <- "2007-02-02 23:59:59"
output.fn <- "plot2.png"
img.h <- 480
img.w <- 480
img.bg <- "white"
img.plot.main <- ""
img.plot.xlab <- ""
img.plot.ylab <- "Global Active Power (kilowatts)"
img.plot.col <- "black"
img.plot.type <- "n"

#read the input file
df <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?",
                 colClasses = c(rep("character",2),
                                rep("numeric",7)))

#add POSIX date/time column and subset data by the date range
df$POSIXtime <- as.POSIXct(strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S"))
df.selected <- subset(df, POSIXtime >= as.POSIXct(start.ts) & POSIXtime <= as.POSIXct(end.ts))

#draw and save
png(filename = output.fn, height = img.h, width = img.w, bg = img.bg)
plot(df.selected$POSIXtime, df.selected$Global_active_power,
     type = img.plot.type,
     col = img.plot.col,
     main = img.plot.main,
     xlab = img.plot.xlab,
     ylab = img.plot.ylab)
lines(df.selected$POSIXtime, df.selected$Global_active_power)
dev.off()
