read_data = function(){
	# read data
	d = read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings = "?", 
	               colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 
	                            'numeric', 'numeric', 'numeric', 'numeric'))

	# select only two days 2007-02-01 and 2007-02-02
	d = d[(d$Date == '1/2/2007') | (d$Date == '2/2/2007'),]

	# convert date
	d$Date = as.Date(d$Date, "%d/%m/%Y")
	d$DateTime = as.POSIXct(paste(d$Date, d$Time), format="%Y-%m-%d %H:%M:%S")
	return(d)
}

d = read_data()

# plot 3
with(d, {
    plot(DateTime, Sub_metering_1, type='l', col='black', ylab='Energy sub metering', xlab='', ylim=c(0,38))
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend('topright', c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1, col=c('black', 'red', 'blue'))
    }
)

dev.copy(png,'plot3.png')
dev.off()