#scale函数
x<-c(1,2,3,4,5,6,7,8,9)
newdata<-scale(x)#均值为0，标准差为1，标准化
newdata1<-scale(x)*SD+M#SD标准差，M均值
newdata2<-transform(x,myvar=scale(x)*10+50)

#normal distribution
x<-pretty(c(-3,3),30)
y<-dnorm(x)
plot(x,y,type="l",xlab="Normal Deviate",
     ylab="Density",yaxs="i")

#0-1间随机数
runif(5)
set.seed(1234)#确保下次运行的重复性
runif(5)

#正态分布随机数
library(MASS)
options(digits = 3)
set.seed(1234)

mean<-c(230.7,146.7,3.6)
sigma<-matrix(c(15360,352,47,241,452,65.5,25,457,0.3),
              nrow = 3,ncol = 3)
mydata<-mvrnorm(500,mean,sigma)
mydata<-as.data.frame(mydata)
names(mydata)<-c("y","x1","x2")
dim(mydata)
head(mydata,n=10)

#character functions
x<-c("ab","cde","sjliueci")
length(x)
nchar(x[3])

x<-"ajnsciuiqg"
substr(x,2,5)
substr(x,2,5)<-"23456"

grep("A",c("a","A","c"),fixed=TRUE)

sub("\\s",".","Hello World")

y<-strsplit("abcd"," ")

paste("x",1:3,sep=" ")
paste("x",1:3,sep="M")
paste("Today is",date())

toupper(x)
tolower(x)

a<-c(1,2,3,4,5,7)
length(a)

b<-seq(1,131,10)

c<-rep(1:5,2)

firstname<-c("Jane")
cat("Hello",firstname,"\n")
#\n for new lines
#\t tabs
#\' a single quote
#\b backspace

#apply functions to data objects
a<-5
sqrt(a)
b<-c(1.234,5.617,8.0243)
round(b)
c<-matrix(runif(12),nrow=3,ncol=4)
log(c)
mean(c)

#apply functions to rows/columns
mydata<-matrix(rmorm(30),nrow=6)
apply(mydata,1,mean)#row means
apply(mydata,2,mean)#col means
apply(mydata,2,mean,trim=0.2)#前20%和后20%数值排除

#a challenge
options(digits = 2)

student<-c("John Davis", "Angela Williams", "Bullwinkle Moose", 
           "David Jones", "Janice Markhammer", "Cheryl Cushing", 
           "Reuven Ytzrhak", "Greg Knox", "Joel England", "Mary Rayburn")
math<-c(502,600,412,358,495,512,410,625,573,522)
science<-c(95,99,80,82,75,85,80,95,89,86)
english<-c(25,22,18,15,20,28,15,30,27,18)
roster<-data.frame(student,math,science,english,stringsAsFactors = FALSE)

z<-scale(roster[,2:4])#给分数统一单位，便于比较
score<-apply(z,1,mean)#个人分数均数
roster<-cbind(roster,score)
y<-quantile(score,c(0.8,0.6,0.4,0.2))#成绩分级打等第
roster$grade[score >=y[1]]<-"A"#logical operators
roster$grade[score < y[1] & score >= y[2]]<-"B"
roster$grade[score < y[2] & score >= y[3]]<-"C"
roster$grade[score < y[3] & score >= y[4]]<-"D"
roster$grade[score < y[4]]<-"F"

name<-strsplit((roster$student)," ")#提取名字 
lastname<-sapply(name, "[",2)#take the first element of each component
firstname<-sapply(name, "[",1)#"[" is a function that extracts part of an object—here the first or second component of the list name
roster<-cbind(firstname,lastname,roster[,-1])# You’ll use cbind() to add them to the roster. Because you no longer need the student variable, you’ll drop it (with the –1 in the roster index).

roster<-roster[order(lastname,firstname),]

#Repetition and looping
for(i in 1:10) print("Hello World")

i<-10
while(i > 0) {print("Hello World"); i<-i-1}

#condition
if(!is.factor(grade)) grade<-as.factor(grade) else print("Grade is already a factor")
ifelse(score>0.5,print("Passed"),print("Failed"))                                                                                                  
outcome<-ifelse(score>0.5,"Passed","Failed")

#an example
feelings<-c("sad","afraid")
for (i in feelings)
  print(
    switch(i,
           happy = "HaHaHa",
           afraid = "Aha",
           sad = "Cheer up",
           angry = "calm down")
  )

#mystats:summary statistics
mystats<-function(x,parametric=TRUE,print=FALSE){
  if(parametric)
  {center<-mean(x);spread<-sd(x)}
  else
  {center<-median(x);spread<-mad(x)}
  if(print&parametric)
  {cat("mean=",center,"\n","SD=",spread,"\n")}
  else if(print&!parametric)
  {cat("median=",center,"\n","mad=",spread,"\n")}
  result<-list(center=center,spread=spread)
  return((result))
}

set.seed(1234)
x<-rnorm(500)
y<-mystats(x,parametric = FALSE,print = TRUE)

#mydate
mydate<-function(type="long")
{switch(type,
        long=format(Sys.time(),"%A %B %d %Y"),
        short=format(Sys.time(),"%m-%d-%y"),
        cat(type,"is not recongnized type\n"))}

#generate a warning message
warning("You are fired!!!")
#diagnosic message
message("Have a nice day!!!")
# stop execution of the current expression and carry out the error acton
stop()

#transporting a dataset
cars<-mtcars[1:5,1:4]
cars
t(cars)#transpose a data frame or a matrix

#aggregating data
options(digits = 3)
attach(mtcars)
aggdata<-aggregate(mtcars,by=list(group.cyl=cyl,group.gear=gear),FUN=mean,na.rm=TRUE)

#reshape package #分类汇总
library(reshape)
md<-melt(mydata,id=(c("id","time")))
cast(md,id+variable~time)







