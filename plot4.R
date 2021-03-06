## Load data
powerdf <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")

## Subset data
power_subdf <- subset(powerdf, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(power_subdf$Date), power_subdf$Time)
power_subdf$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_subdf, {
    plot(Global_active_power~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l",
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
            legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l",
         ylab="Global Reactive Power (kilowatts)",xlab="")
})


## Save Plot to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
