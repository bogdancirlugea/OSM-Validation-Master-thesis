# Simple data
library(ggplot2)
library(RColorBrewer)

setwd("D:/R Working Directory/Query_results/Gambia")
simple_data <- read.csv(file="gambia_length.csv", header=TRUE, sep=";")
simple_data <- head(simple_data[complete.cases(simple_data),],-2)
simple_data$date <- as.Date(simple_data$time_points)
simple_data$lengthkm <- simple_data$sum/1000
g1 <- ggplot(data=simple_data, aes(x=simple_data$date, y=simple_data$lengthkm)) + geom_line(colour="red",size=1.2) + xlab("Date") + ylab("Road network length (km)") +
ggtitle("Gambia - OSM road network evolution")+theme(plot.title = element_text(size=15, face="bold", vjust=2), axis.title.x = element_text(size=13 , face="bold" , vjust=-0.5),axis.title.y = element_text(size=13 , face="bold" , vjust=1.5))
png('length_plot.png',width = 10, height= 7, units = 'in' , res = 300)
plot(g1)
dev.off()

#By category - All categories
complex_data <- read.csv(file="gambia_length_category.csv", header=TRUE, sep=";")
complex_data <- complex_data[complete.cases(complex_data),]
complex_data$date <- as.Date(complex_data$time_points)
complex_data$lengthkm <- complex_data$sum/1000
complex_data <- subset(complex_data, complex_data$date < "2015-12-01")
#Produce colors
colors <- brewer.pal(12, "Paired")
pal <- colorRampPalette(colors)
g2 <- ggplot(data=complex_data, aes(x=complex_data$date, y=complex_data$lengthkm, group=complex_data$X.column.,colour=complex_data$X.column.)) + scale_colour_manual(values=pal(length(unique(complex_data$X.column.))),name  ="Road category") + guides(col = guide_legend(nrow = 20)) + geom_line(size=1.2) + xlab("Date") + ylab("Road network length (km)") +
ggtitle("Gambia - OSM road network evolution by road categoty") + theme(plot.title = element_text(size=15, face="bold", vjust=2), axis.title.x = element_text(size=13 , face="bold" , vjust=-0.5),axis.title.y = element_text(size=13 , face="bold" , vjust=1.5))
png('all_category_plot.png',width = 15, height= 7, units = 'in' , res = 300)
plot(g2)
dev.off()

#By category - 5 most important categories
complex_data <- read.csv(file="gambia_length_category.csv", header=TRUE, sep=";")
complex_data <- complex_data[complete.cases(complex_data),]
complex_data$date <- as.Date(complex_data$time_points)
complex_data <- subset(complex_data, complex_data$date < "2015-12-01")
complex_data$lengthkm <- complex_data$sum/1000
selector <- subset(complex_data, complex_data$date == "2015-11-01")
selector <- selector[with(selector, order(-lengthkm)), ] 
type_selector <- selector$X.column.[1:6]
complex_data_selected <- subset(complex_data,complex_data$X.column.%in%type_selector==TRUE)
cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#0072B2", "#D55E00", "#CC79A7")
g3 <- ggplot(data=complex_data_selected, aes(x=complex_data_selected$date, y=complex_data_selected$lengthkm, group=complex_data_selected$X.column., colour=complex_data_selected$X.column.)) + scale_colour_manual(values=cbbPalette,name  ="Road category") + geom_line(size=1.2) + xlab("Date") + ylab("Road network length (km)") +
ggtitle("Gambia - OSM road network evolution by road category \n (6 main categories)") + theme(plot.title = element_text(size=15, face="bold", vjust=2), axis.title.x = element_text(size=13 , face="bold" , vjust=-0.5),axis.title.y = element_text(size=13 , face="bold" , vjust=1.7))
png('5_cat_plot.png',width = 10, height= 7, units = 'in' , res = 300)
plot(g3)
dev.off()