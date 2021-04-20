#vectors
a<-c(1,2,5,3,6,-2,4)
b<-c("one","阿嚏","@#^&%")
c<-c(TRUE,FALSE,TRUE)

#refer to elements
a[3]#第3个数
a[c(1,3,5)]#第1,3,5个数
a[2:6]#第2-6个数

#matrices
y<-matrix(1:20,nrow = 5,ncol = 4)

cells<-c(1,26,24,28)
rnames<-c("R1","R2")
cnames<-c("C1","C2")
mymatrix<-matrix(cells,nrow = 2,ncol = 2,byrow = TRUE,
          dimnames = list(rnames,cnames))

x<-matrix(1:10,nrow = 2)
x[2,]#第2行
x[,2]#第2列
x[1,4]#第1行，第2列
x[1,c(4,5)]#第1行，第4,5个数

#Arrays
dim1<-c("A1","A2")
dim2<-c("B1","B2","B3")
dim3<-c("C1","C2","C3","C4")
z<-array(1:24,c(2,3,4),dimnames = list(dim1,dim2,dim3))

#Data frames
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("Type1","Type2","Type1","Type1")
status<-c("Poor","Improved","Excellent","Poor")
patientdata<-data.frame(patientID,age,diabetes,status,
                        row.names = patientID)#specifies patientID as a variable

patientdata[1:3]#第1-3列
patientdata[c("diabetes","status")]
patientdata$diabetes
table(patientdata$diabetes,patientdata$status)

summary((mtcars$mpg))#基本统计量
plot(mtcars$mpg,mtcars$disp)
plot(mtcars$mpg,mtcars$wt)

attach(mtcars)#导入数据集
  summary(mpg)#导入后直接写列名即可
  plot(mpg,disp)
detach(mtcars)
#with函数
with(mtcars,{summary(mpg,disp,wt)
  plot(mpg,disp)})
with(mtcars,{
  stats <- summary(mpg)#留在with之内
  stats})
with(mtcars,{
  nokeepstats<-summary(mpg)
  keepstats<<-summary(mpg)#<<-保存到with之外的global environment
})  

#Factors以整数向量值储存有序类别
status<-factor(status,order=TRUE,
               levels=c("Poor","Improved","Excellent"))#levels用来排序
sex<-factor(sex,levels = c(1,2),labels = c("Male","Female"))

#Example.1
patientID<-c(1,2,3,4)
age<-c(25,34,28,52)
diabetes<-c("Type1","Type2","Type1","Type1")
status<-c("Poor","Improved","Excellent","Poor")
diabetes<-factor(diabetes)
status<-factor(status,ordered = TRUE)
patientdata<-data.frame(patientID,age,diabetes,status)
str(patientdata)#显示对象结构
summary(patientdata)
                        
#list
g<-"My First List"
h<-c(25,26,18,39)
j<-matrix(1:10,nrow = 5)
k<-c("one","two","three")
mylist<-list(title = g,ages=h,j,k)
mylist[[2]]
mylist[["ages"]]

#data input
#keyboard
mydata<-data.frame(age=numeric(0),gender=character(0),weight=numeric(0))
mydata<-edit(mydata)

#annotating datasets
names(patientdata)[2]<-"Age at Hospitalization"
patientdata$status<-factor(patientdata$status,
                           levels = c(1,2,3),
                           labels = c("poor","improved","excellent"))







  
  
  
  
