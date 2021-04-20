#a working example
manager <- c(1, 2, 3, 4, 5)
date <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3, 3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, date, country, gender, age,
                         q1, q2, q3, q4, q5, stringsAsFactors=FALSE)

#creating variables
mydata<-data.frame(x1 = c(2, 2, 6, 4),x2 = c(3, 4, 2, 8))
mydata$sumx <- mydata$x1 + mydata$x2
mydata$meanx <- (mydata$x1 + mydata$x2)/2
attach(mydata)mydata$sumx <- x1 + x2
mydata$meanx <- (x1 + x2)/2
detach(mydata)
mydata <- transform(mydata,sumx = x1 + x2,meanx = (x1 + x2)/2)

#recoding variables(from continous variable to categorical variable)
leadership$age[leadership==99]<-NA#将NA换成99
leadership$agecat[leadership$age > 75] <- "Elder"
leadership$agecat[leadership$age >= 55 &
                    leadership$age <= 75] <- "Middle Aged"
leadership$agecat[leadership$age < 55] <- "Young"

leadership<-within(leadership,{agecat<-NA
                               adecat[age>75]<-"Elder"
                               agecat[age>=55&age<=75]<-"Middle Aged"
                               agecat[age<55]<-"Young"})
#renaming variables
fix(leadership)
library(reshape)
leadership<-rename(leadership,c(manager="managerID",data="testDate"))

names(leadership)
names(leadership)[2]<-"testDate"

names(leadership)[6:10]<-c("item1","item2","item3","item4","item5")

#missing value
y<-c(1,2,3,NA)
is.na(y)#有没有NA
is.na(leadership[,6:10])

leadership$age[leadership$age==99]<-NA#缺失值赋为99

x<-c(1,2,NA,3)
y<-sum(x,na.rm=TRUE)#除去缺失值求和

newdata<-na.omit(leadership)#删去缺失值的数据框

#date values
mydates<-as.date(c("2013-5-3","2017-8-2"))
strDates<-c("01/05/1965","08/16/1975")
dates<-as.Date(strDates,"%m/%d/%Y")#月、日、年(四个数字)

myformat<-"%m/%d/%y"
leadership$testDate<-as.Date(leadership$testDate,myformat)#已由上面程序修改过变量名
Sys.Date()#现在日期
date()#时间

today<-Sys.Date()
format(today,format="%B %d %Y")
format(today,format="%A")

startdate<-as.Date("2001-2-13")
enddate<-as.Date("2011-10-16")
days<-enddate-startdate#日期计算

today<-Sys.Date()
dob<-as.Date("1956-10-12")
difftime(today,dob,units = "weeks")

#数据类型转换
a<-c(1,2,3)
is.numeric(a)
is.vector(a)

a<-as.character(a)
is.character(a)

#sorting data
newdata<-leadership[order(leadership$age),]#从小到大排序

attach(leadership)
newdata<-leadership[order(gender,age),]#性别分类，年龄排序
detach(leadership)

#merging datasets
total<-merge(dataframeA,dataframeB,by=c("ID","Country"))#adding columns
total<-cbind(A,B)#join two matrices or dataframes
total<-rbind(dataframeA,dataframeB)#adding rows

#subsetting datasets
newdata<-leadership[,c(6:10)]#提取

myvars<-c("q1","q2","q3","q4","q5")
newdata<-leadership[myvars]

myvars<-paste("q",1:5,sep="")

myvars<-names(leadership %in% c("q3","q4"))
newdata<-leadership[!mycars]#除去q3,q4

newdata<-leadership[c(-8,-9)]#除去第八、第九个变量
leadership$q3<-leadership$q4<-NULL

#selecting observations
newdata<-leadership[1:3,]
newdata<-leadership[which(leadership$gender=="M"&
                            leadership$age>30),]
attach(leadership)
newdata<-leadership[which(gender=="M" & age > 30)]
detach(leadership)

leadership$testDate<-as.Date(leadership$testDate,"%m/&d/%y")
startdate<-as.Date("2009-01-01")
enddate<-as.Date("2009-10-31")
newdata<-leadership[which(leadership$testDate >=startdate &
                            leadership$testDate <=enddate,)]

newdata<-subset(leadership,age >=35|age<24,
                select=c(q1,q2,q3,q4))
newdata<-subset(leadership,gender=="M" & age>25,
                select=gender:q4)

#random examples
mysample<-leadership[sample(1:nrow(leadership)),3,replace=FALSE]

#SQL statements
library(sqldf)
newdf<-sqldf("select*from mtcars where carb=1 order by mpg",
             row.names=TRUE)








