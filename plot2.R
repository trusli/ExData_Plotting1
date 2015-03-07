## Load data
powerdf <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                    check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
powerdf$Date <- as.Date(powerdf$Date, format="%d/%m/%Y")

## Subset data
power_subdf <- subset(powerdf, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates
datetime <- paste(as.Date(power_subdf$Date), power_subdf$Time)
power_subdf$Datetime <- as.POSIXct(datetime)

## Plot 2
plot(power_subdf$Datetime,power_subdf$Global_active_power, type="l",ylab="Global Active Power (kilowatts)", xlab="")

## Save Plot to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

