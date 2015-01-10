## plot3.R
## 2015-01-09
## exdata-010 - assignment 1
## Read Individual household electric power consumption Data Set from the 
## UC Irvine Machine Learning Repository and make a plot of submetering 
## for selected date range

#settings
start.ts <- "2007-02-01 00:00:00"
end.ts <- "2007-02-02 23:59:59"
output.fn <- "plot3.png"
img.h <- 480
img.w <- 480
img.bg <- "white"
img.plot.main <- ""
img.plot.xlab <- ""
img.plot.ylab <- "Energy sub metering"
img.plot.col_1 <- "black"
img.plot.col_2 <- "red"
img.plot.col_3 <- "blue"
img.plot.type <- "n"
img.legend.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
img.legend.col <- c(img.plot.col_1, img.plot.col_2, img.plot.col_3)

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
plot(df.selected$POSIXtime, df.selected$Sub_metering_1,
     type = img.plot.type,
     col = img.plot.col,
     main = img.plot.main,
     xlab = img.plot.xlab,
     ylab = img.plot.ylab)
legend("topright", pch = NA, lwd = 1, lty = 1, col = img.legend.col, legend = img.legend.txt)
lines(df.selected$POSIXtime, df.selected$Sub_metering_1, col = img.plot.col_1)
lines(df.selected$POSIXtime, df.selected$Sub_metering_2, col = img.plot.col_2)
lines(df.selected$POSIXtime, df.selected$Sub_metering_3, col = img.plot.col_3)
dev.off()