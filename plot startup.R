#打开新的图片窗口
dev.new()
#input vector
dose<-c(20,30,40,45,60)
DrugA<-c(16,20,27,40,60)
DrugB<-c(15,18,25,31,40)
#simple plot
opar<-par(no.readonly=TRUE)#保存初始格式
par(pin=1)#修改格式
par(lwd=2,cex=1.5)
par(cex.axis=0.75,font.axis=3)
plot(dose,DrugA,type="b",pch=19,lyt=2,col="red")
plot(dose,DrugB,type="b",pch=23,lyt=6,col="blue",bg="green")
par(opar)#调出初始格式
#乱炖plot
plot(dose,DrugA,type="o",col="red",lty=2,pch=2,lwd=2,
     main="Clinical Trails For DrugA",sub="hypothetical data",
     xlab = "Dosage(mg)", ylab = "Drug Response",
     xlim = c(0,60), ylim = c(0,70))
#title、axis函数
plot(dose,DrugB,type="o",col="blue",lty=2,pch=2,lwd=2,
     ann = FALSE,axes = TRUE,frame.plot = FALSE,
     xaxt = "n")#不留x轴，留y轴
title(main = "Trails",col.main = "purple",
      sub = "data",col.sub = "chocolate",
      xlab = "oho",ylab = "aha",
      col.lab = "green",cex.lab = 0.75)
axis(1,at=dose,labels = round(dose,digits = 2),
     pos = 10 ,col.axis = "red",las = 2,tck = 0.01,)

#Example.1
x <- c(1:10)#specify data
y <- x
z <- 10/x
opar <- par(no.readonly = TRUE)#store parameter
par(mar=c(5,4,4,8)+0.1)#increase margins
plot (x,y,type="b",pch=21,col="red",yaxt="n",lyt=3,ann = FALSE)#plot x-y
lines(x,z,type="b",pch=22,col="blue",las=2,cex.axis=0.7,tck=-0.01)#add 1/x line
axis(2,at=x,labels = x,col.axis="red",las=2)#axes
axis(4,at=z,labels = round(z,digits = 2),
     col.axis="blue",las=2,cex.axis=0.7,tck=-0.01)
mtext("y=1/x",side=4,line=3,cex.lab=1,las=2,col = "blue")#add margin text
title("Example.1",xlab="x values",ylab="Y=X")#add title
par(opar)

#minor tick
library(Hmisc)
minor.tick(nx=5,ny=2,tick.ratio=0.5)#x,y分度值等分5,2份
#Reference lines
abline(h=c(20,30,40),lty=2,col="green")
abline(v=c(20,30,40),lty=2,col="yellow")
#legend
legend(locator(1),title = "Drug type",c("A","B"),
       lty=c(1,2),lwd=c(2,2),pch=c(15,17),col = c("red","blue"),
       fill="gray",bg="purple",bty = 2,cex = 0.05,horiz = TRUE)

#Example.2
dose <- c(20, 30, 40, 45, 60)
DrugA <- c(16, 20, 27, 40, 60)
DrugB <- c(15, 18, 25, 31, 40)

opar <- par(no.readonly=TRUE)
par(lwd=2, cex=1.5, font.lab=2)

plot(dose, DrugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")
lines(dose, DrugB, type="b",
      pch=17, lty=2, col="blue")
abline(h=c(30), lwd=1.5, lty=2, col="gray")
library(Hmisc)
minor.tick(nx=3, ny=3, tick.ratio=0.5)
legend("topleft", inset=0.05, title="Drug Type",
       c("A","B"),lty=c(1, 2), pch=c(15, 17), 
       col=c("red", "blue"),cex=0.1)
par(opar)

#text annotations
attach(mtcars)
plot(wt,mpg,main = "mileage vs.car weight",
     xlab = "weight",ylab = "Mileage",
     pch=18,col="blue")
text(wt,mpg,rownames(mtcars),cex=0.6,pos = 4,col="red")
mtext("真是非常Amazing啊",side=4,col="blue",font=3)
detach(mtcars)

#an example to display fond families
opar<-par(no.readonly = TRUE)
par(cex=1.1)
plot(1:7,1:7,type="n")
text(3,3,"天气好冷")
text(4,4,family="mono","我的心是冰冰的")
text(5,5,family="serif","真的是非常Amazing啊")
par(opar)

#combining graphs
attach(mtcars)
opar<-par(no.readonly = TRUE)
par(mfrow=c(2,2))#2*2的四张表
plot(wt,mpg,main = "Scatterplot of wt vs.mpg")
plot(wt,disp,main = "Scatterplot of wt vs.disp")
hist(wt,main = "Hist of wt")
boxplot(wt,main="boxplot of wt")
par(opar)
detach(mtcars)

attach(mtcars)
opar<-par(no.readonly = TRUE)
par(mfrow=c(3,1))#3张表一列
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

attach(mtcars)
layout(matrix(c(1,1,2,3),2,2,byrow=TRUE),
       widths=c(3,1),heights=c(1,2))
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)

#box plot added to the margin
opar<-par(no.readonly = TRUE)
plot(mtcars$wt,mtcars$mpg,
     xlab = "Miles Per Gallon",ylab = "Car Weight")
  #box plot
par(fig=c(0,0.8,0.6,1),new=TRUE)
boxplot(mtcars$wt,horizontal = TRUE,axes=FALSE)
par(fig=c(0.65,1,0,0.8),new=TRUE)
boxplot(mtcars$mpg,horizontal=FALSE,axes=FALSE)
mtext("Enhanced plot",side=3,outer = TRUE,line=3)
par(opar)

#advanced plot
library(ggplot2)
library(ragg)
library(palmerpenguins)
# plot adapted from allisonhorst/palmerpenguins
p <- ggplot(na.omit(penguins), aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(
    aes(color = species, shape = species),
    size = 3,
    alpha = 0.8
  ) + 
  ggforce::geom_mark_ellipse(
    aes(filter = species == "Gentoo", 
        description = "Gentoo penguins are generally bigger in size")
  ) + 
  labs(x = "Flipper Length [mm]", y = "Body Mass [g]",  colour = "Species", 
       shape = "Species")

pngfile <- fs::path(knitr::fig_path(),  "basis.png")

# I'm explicitly calling the device functions so you can see the dimensions 
# used
agg_png(pngfile, width = 20, height = 12, units = "cm", res = 300)
plot(p)
invisible(dev.off())
knitr::include_graphics(pngfile)





