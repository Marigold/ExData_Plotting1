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

# plot 1
with(d, plot(DateTime, Global_active_power, type='l', ylab='Global Active Power (kilowatts)', xlab=''))
dev.copy(png,'plot2.png')
dev.off()