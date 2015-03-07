## Load data
powerdf <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")

## Subset data
power_subdf <- subset(powerdf, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(power_subdf$Date), power_subdf$Time)
power_subdf$Datetime <- as.POSIXct(datetime)

## Plot 3
with(power_subdf, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


## Save Plot to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
