set_plot <- function(){
    png(
        "plot1.png",
        width     = 480,
        height    = 480,
        units     = "px"
    )
}

load_data <-function(filename){
    my_data <-read.table(filename,header=TRUE,na.strings="?",sep=";")
    
    # 2007-02-01 and 2007-02-02
    filtro <- my_data$Date == "1/2/2007" | my_data$Date == "2/2/2007"
    my_data <- my_data[filtro,]
    my_data
}

MyPlot<-function(datos){
    hist(datos$Global_active_power, xlab="Global Active Power(kilowatts)", col="red", main="Global Active Power")
    
}

datos <- load_data("household_power_consumption.txt")
set_plot()
MyPlot(datos)
dev.off()
