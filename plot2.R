#power_consumption_data<-read.table("household_power_consumption.txt",sep=";")
#format(object.size(power_consumption_data),units="MB")
power_consumption_data_subset<-read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")
format(object.size(power_consumption_data_subset),units="MB")
power_consumption_data_subset$Date <- as.Date(power_consumption_data_subset$Date , "%d/%m/%Y")
png(filename="plot2.png")
power_consumption_data_subset$DateTime<-with(power_consumption_data_subset,as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
with(power_consumption_data_subset,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))


dev.off()
