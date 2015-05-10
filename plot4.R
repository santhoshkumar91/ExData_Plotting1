#power_consumption_data<-read.table("household_power_consumption.txt",sep=";")
#format(object.size(power_consumption_data),units="MB")
power_consumption_data_subset<-read.csv.sql("household_power_consumption.txt",sep=";",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'")
format(object.size(power_consumption_data_subset),units="MB")
power_consumption_data_subset$Date <- as.Date(power_consumption_data_subset$Date , "%d/%m/%Y")

power_consumption_data_subset$DateTime<-with(power_consumption_data_subset,as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))
png(filename="plot4.png")

par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0, 0, 0, 0))

#Plot 1
with(power_consumption_data_subset,plot(DateTime,Global_active_power,type="l",xlab="",ylab="Global Active Power"))

#Plot 2
with(power_consumption_data_subset,plot(DateTime,Voltage,type="l",xlab="datetime",ylab="Voltage"))


#Plot 3
with(power_consumption_data_subset,plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"),col="black")
with(power_consumption_data_subset,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(power_consumption_data_subset,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright", col = c( "black","red","blue"), bty="n",legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1))


#Plot 4

with(power_consumption_data_subset,plot(DateTime,Global_reactive_power,type="l",xlab="datetime"))
dev.off()