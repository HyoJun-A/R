x = c(1, 2)
rep(x, times=2)
rep(x, each=2)

x = c("male", "female", "female", "female", "male")
class(x)
glevel = c("male", "female")
class(glevel)
gender1 <- factor(x, levels = glevel)
gender1
class(gender1)

gender2 <- factor(c("male", "female", "female", "female", "male"), levels=c("male", "female"))
gender2
class(gender2)

gender3 <- factor(c("male", "female", "female", "female", "male"))
gender3
class(gender3)

nlevels(gender1)
levels(gender1)
is.factor(gender1)

gender1[1]
gender1[1] <- "female"

gender2[2:3]
gender2[2:3] <- c("male", "male") 

gender3[6] <- "female"
gender3
gender3[7] <- "girl"

levels(gender3) <- c("male", "female", "girl")
levels(gender3)

gender3[7] <- "girl"
gender3

x=array(1:24, dim=c(3,2,4))
dim(x)

data1 <- 1:4
data2 <- matrix(1:6,3, byrow=TRUE)
data3 <- array(1:24, c(3,4,2))
data4 <- data.frame(id = c(1,2,3,4), name=c("LEE", "PARK", "KIM", "SHIN"))

list1 <- list(data1, data2, data3, data4)
list1

dim(mtcars)
str(mtcars)
summary(mtcars)

is.matrix(mtcars)
is.data.frame(mtcars)

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
col.sums <- apply(x, 2, sum)
col.sums
row.sums <- apply(x, 1, sum)
row.sums

data1 <- read.csv("grade.csv")
data1
data2 <- read.csv("grade_space.txt", sep =" ")
data2

write.csv(data1, file="csv1.csv", quote=FALSE)
read.csv("csv1.csv")
write.csv(data1, file="csv2.csv", row.names=FALSE, quote=FALSE)
read.csv("csv2.csv")

install.packages=("readxl")
library(readxl)

data <- read_excel("grade.xlsx")
data

data1 <- read_excel("grade_nocol.xlsx", col_names = F)
data1


str <- c("I LOVE R")
str
strsplit(str, split=" ")

name <- c("Michle", "Jordan", "JUlia", "Robert", "Nicole", "Kidman")
name
sp_name <- strsplit(name, split=",")
sp_name

number <- c("202011042", "2019010015", "2020009030", "2018011024")
year <- substr(number, 1, 4)
year

str <- "R is very good!! I love R"
str
sub("R", "Python", str)
gsub("R", "Python", str)

grep("2020", number)
grep("2020", number, value=TRUE)
grep("2020", number, value=TRUE, invert=TRUE)

days <- c("Sunday", "Monday", "Tuesday")
days
grepl("day", days)
grepl("Mon", days)
grepl("mon", days, ignore.case=TRUE)

regexpr("2020", number)

regexpr("R", " I love R. R is very good!! ")

gregexpr("2020", number)
gregexpr("R", " I love R. R is very good!! ")

class(mtcars)
dim(mtcars)
head(mtcars)
str(mtcars)
summary(mtcars)

mpg <- mtcars$mpg
hist(mpg)
hist(mpg, breaks=seq(10, 34, 6), col=rainbow(range(mpg)), main="mpg의 히스토그램", xlab="연비" ,ylab="측정값값")

gear <- mtcars$gear
gear

gear <- table(gear)
gear
barplot(gear, main="gear의 수에 의한 자동차의 수", xlab="gear", ylab="자동차 수" ,col=rainbow(length(gear)))
barplot(gear, main="gear의 수에 의한 자동차의 수", xlab="gear", ylab="자동차 수", col=rainbow(length(gear)), horiz=TRUE, xlim=c(0, 16))

pct <- round(gear/sum(gear)*100.0)
for (i in 1:length(gear)){
  gear_lable[i] <- paste("gear",as.character(i + 2),":",pct[i],"%")
}
pie(gear, main="gear의 수에 의한 자동차의 점유율", col=rainbow(length(gear)))

wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main="자동차 중량에 따른 연비", xlab="중량", ylab="연비", pch=21, col="red", bg="green", cex=1.5)

mpg <- mtcars$mpg
disp <- mtcars$disp
hp <- mtcars$hp
wt <- mtcars$wt
data <- data.frame(mpg, disp, hp, wt)
data
pairs(data, main="자동차 산점도 행렬", col="blue")

boxplot(mpg)$stats
boxplot(formula=mpg~am, data=mtcars,
        col=c("yellow", "green"),
        xlim=c(0.5,2.5),
        ylim=c(5, 40),
        xlab="Transmission",
        ylab="gallon",
        names=c("automatic", "manual"))

par(mfrow=c(2,3))
x= 1:10
y=c(10, 20 ,30, 40, 50 ,60, 70 ,80 ,90, 100)
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")
plot(x,y, type="o")

par(mfrow=c(1,1))
colnames(Orange)
str(Orange)
head(Orange)
Orange$tree
tree <- as.numeric(Orange$Tree)
age <- range(Orange$age)
cir <- range(Orange$circumference)
plot(age, cir, type="o", xlab="age", ylab="Circumference")
n <- max(tree)
colors <- rainbow(n)
tree
linetype <- c(1:n)
pchs <- c(1:n)

for(i in 1:n){
  temp <- subset(Orange, Tree ==i)
  lines(temp$age, temp$circumference, type="b",
       lwd=2, lty=linetype[i],
       col=colors[i],pch=pchs[i])
}

title("Tree Growth graph")
legend(age[1], cir[2], legend=1:n,
       col= colors, cex=0.8, pch=pchs, lty=linetype)

R1 <- c("I", "love", "R")
R2 <- data.frame(R1, R4=c(1, 3, 2))
R2
class(R2)
subset(R2, R1=="I")

mycin <- as.data.frame(Puromycin)
str(mycin)
summary(mycin)
mycin[2, 1] <- NA
mycin[5, 2] <- NA
mycin[7, 3] <- NA
head(mycin, 7)

is.na(mycin)
is.na(mycin$conc)
is.na(mycin[1:5,])

sum(is.na(mycin))
sum(is.na(mycin$conc))
table(is.na(mycin))
table(is.na(mycin$conc))

sum(mycin$conc)
sum(mycin$conc, na.rm=TRUE)

mycin_omit <- na.omit(mycin)
head(mycin_omit)
mycin_rm <- mycin[complete.cases(mycin),]
head(mycin)
head(mycin_rm)

head(mycin$conc)
mycin$conc[is.na(mycin$conc)] = 0
head(mycin$conc)
head(mycin$rate)
mycin$rate[is.na(mycin$rate)] = mean(mycin$rate, na.rm=T)
head(mycin$rate)

orange <- as.data.frame(Orange)
head(orange, 8)
table(orange$age)
orange$age[10] <- 1100
orange$age[20] <- 2000
table(orange$age)
orange$age <- ifelse(orange$age ==1100 | orange$age == 2000, NA, orange$age)
table(orange$age)

table(is.na(orange$age))
orange$circumference[30] <- 400
boxplot(orange$circumference)
boxplot.stats(orange$circumference)

orange$circumference <- ifelse(orange$circumference == 400, NA, orange$circumference)
boxplot.stats(orange$circumference)$out

table(is.na(orange$circumference))

install.packages("dplyr")
library(dplyr)
mtcar1 <- mtcars
head(mtcar1)
str(mtcar1)

str(mtcar1)

select(mtcar1, mpg, cyl, vs)
select(mtcar1, -am, -gear, -carb)
mtcar1 %>% select(mpg, cyl, vs)

mtcar1 %>% filter(cyl==6)

mtcar1 %>% filter(gear==4) %>% select(mpg, cyl, disp)

mtcar1 %>% filter(mpg>21) %>% select(disp, hp, wt)

mtcar1 %>% slice(3:7)

mtcar1 %>% arrange(mpg)
mtcar1 %>% arrange(desc(mpg))
mtcar1 %>% arrange(cyl, mpg)
mtcar1 %>% distinct(cyl)

mtcar1 %>% mutate(sec=qsec*4) %>% head

mtcar1 %>% mutate(valid=ifelse(mpg >= mean(mpg), "pass", "fail")) %>% head

install.packages("ggplot2")
library(ggplot2)
ggplot(data = mtcars)
ggplot(data = mtcars, mapping = aes(x= disp, y = mpg))

ggplot(data=mtcars,aes(x=disp, y=mpg)) + geom_point(aes(color="red", size=3))

ggplot(data = mtcars, aes(x=disp, y=mpg))+
  geom_point()+
  xlim(0, 500)+
  ylim(0,40)+
  theme_bw()+
  ggtitle("mpg & disp scatter point")

ggplot(data = mtcars, aes(x=disp, y=mpg))+
  geom_point()+
  xlim(0, 500)+
  ylim(0, 40)+
  theme_bw()+
  ggtitle("mpg&disp scatter point")+
  labs(x="배기량", y ="연비")+
  theme(plot.title = element_text(size = 17, face='bold', color="blue", hjust=0.5),
        axis.title=element_text(size=13),
        axis.title.y=element_text(angle=0, vjust=0.5)
  )

ggplot(data=mtcars, aes(cyl)) + geom_bar()

ggplot(data=Orange, aes(x=age, circumference)) + geom_bar(stat='identity', width=80, fill='red')

ggplot(data=Orange,aes(x=age, y=circumference))+
  geom_bar(stat = 'identity', fill="yellow", width=80)+
  labs(x="나무의 나이", y="나무 둘레")+
  ggtitle("나무의 나이에 따른 나무 둘레")+
  theme(plot.title = element_text(size=15, face='bold', color='blue', hjust=0.5),
        axis.title=element_text(size=13),
        axis.title.y=element_text(angle=0, vjust=0.5))

ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree))+
  geom_bar(stat='identity' )

ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree))+
  geom_bar(stat='identity', position='dodge')

ggplot(data=Orange, aes(x=age, y=circumference, fill=Tree))+
  geom_bar(stat='identity' )+
  coord_flip()

ggplot(data=mtcars, aes(mpg))+
  geom_histogram(binwidth=2)

ggplot(data= mtcars, aes(mpg))+
  geom_histogram(fill="yellow", color="green", binwidth=2)+
  ggtitle("연비의 히스토그램")+
  labs(x="연비", y="빈도")+
  theme(plot.title = element_text(size=20, face='bold', color='black', hjust=0.5),
        axis.title=element_text(size=15),
        axis.title.y=element_text(angle=0, vjust=0.5))

transm=factor(mtcars$am)
ggplot(data=mtcars, aes(mpg, fill=transm))+
  geom_histogram(binwidth = 6, position='dodge')

ggplot(data=mtcars, aes(mpg, fill=transm))+
  geom_histogram(binwidth = 6)

install.packages("ggplot2")
library(ggplot2)
eco <- economics
head(eco)

ggplot(data=eco, aes(x=date, y=unemploy))+
  geom_line(color="red", lwd=1)

ggplot(data=eco, aes(x=date, y=unemploy))+
  geom_line(color='red', lwd=1)+
  geom_hline(yintercept = mean(eco$unemploy), color="blue", linetype='dashed')

ggplot(Orange, aes(age, circumference, color=Tree))+
  geom_line(linetype=2, size=2)

ggplot(data=mtcars, aes(y=mpg))+
  geom_boxplot(fill='red')

ggplot(data =mtcars, aes(x=factor(cyl), y=mpg))+
  geom_boxplot()+
  labs(x="실린더", y="연비")+
  ggtitle("실린더별 연비 상자그림")

ggplot(data =mtcars, aes(y=mpg, fill=factor(cyl)))+
  geom_boxplot()+
  labs(x="실린더", y="연비", fill="cyl")+
  ggtitle("실린더별 연비 상자그림")

ggplot(data=mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl)))+
  geom_boxplot()+
  labs(x="실린더", y="연비", fill="cyl")+
  ggtitle("실린더별 연비 상자그림")

ggplot(data=mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl)))+
  geom_boxplot(width=0.5, outlier.color='red', outlier.shape=2)+
  labs(x="실린더",y="연비", fill='cyl')+
  ggtitle("실린더별 연비 상자그림")+
  theme(plot.title=element_text(size=20, face='bold', color='blue', hjust=0.5),
        axis.title.y=element_text(angle=0, vjust=0.5))

ggplot(data=mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl)))+
  geom_boxplot(outlier.shape=NA)+
  labs(x="실린더",y="연비", fill='cyl')+
  ggtitle("실린더별 연비 상자그림")+
  theme(plot.title=element_text(size=20, face='bold', color='blue', hjust=0.5),
        axis.title.y=element_text(angle=0, vjust=0.5))

ggplot(data=mtcars,aes(x=factor(cyl),y=mpg, fill=factor(cyl)))+
  geom_boxplot()+
  stat_summary(fun="mean", geom='point', shape=21, size=3, fill="yellow")+
  labs(x="실린더", y="연비", fill='cyl')+
  ggtitle('실린더별 연비 상자그림')+
  theme(plot.title=element_text(size=20, face='bold', color='blue', hjust=0.5),
        axis.title.y=element_text(angle=0, vjust=0.5))
