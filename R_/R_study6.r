# 5장 연습문제
# 3 
# lat : 위도, long : 경도, depth : 수심, mag : 리히터 규모, stations
# 3-1 데이터 셋의 데이터의 구조
class(quakes)

# 3-2 quakes 데이터셋의 상위 일부 데이터의 내용
head(quakes)

# 3-3 줄기 잎 그림을 이용해 quakes의 위도와 경도의 분포
stem(quakes$lat)
stem(quakes$long)

# 3-4 지진강도에 대한 히스토그램을 출력
hist(quakes$mag)

# 3-5 지진강도를 0.5 간격으로 히스토그램으로 표현
mag1 <- quakes$mag
mag1

hist(mag1, breaks=seq(4, 6.5, by=0.5))

# 3-6 지진강도의 분포를 상자그림으로 출력 / 상자그림으로 관찰할 수 있는 정보를 같이 출력
boxplot(quakes$mag)$stats  
# $stats를 같이 사용하면 위부터 하위 경계 값, 1사분위수, 2사분위수(중앙 값), 3사분위수, 상위 경계값을 출력해 준다.

#4
# 4-1 데이터셋의 내용을 조사 
?women
help(women)

# 4-2 데이터셋의 구조와 열이름을 확인
class(women)
colnames(women)

# 4-3 선그래프로 표현 
plot(women, type='l') 
# type = p: 점, l:선, b:점과 선, c:b의 선, o:점 위의 선, h:수직선, s:계단형, S:계단형, 
#n:나타나지 않음 

# 5 
# 5-1 iris 데이터셋의 구조와 열 이름
class(iris)
colnames(iris)

# 5-2 데이터셋의 요약 통계량을 확인
summary(iris)

# 5-3 iris 데이터셋의 품종별 꽃잎길이를 상자그림으로 표현 
boxplot(formula=Petal.Length~Species, data=iris)

# 5-4 산점도로 표현
iris_L <- iris$Sepal.Length
iris_W <- iris$Sepal.Width
iris_PL <- iris$Petal.Length
iris_PW <- iris$Petal.Width
data <- data.frame(iris_L,iris_W, iris_PL, iris_PW)
data
pairs(data)

# 6
# 6-1
install.packages("readexl")
library(readxl)
grade <- read_xlsx("grade.xlsx")
grade <- subset(grade, select = -c(...1))
class(grade)
colnames(grade)
grade <- data.frame(grade)
grade

# 6-2 막대그래프
grade2 <- table(grade$grade)
barplot(grade2)
# 6-3 파이 챠트
pie(grade2)
# 6-4 korea, english, math, avg 변수의 값을 히스토그램으로 표현 
par(mfrow=c(2,2))
hist(grade$korea)
hist(grade$english)
hist(grade$math)
hist(grade$avg)

# 6-5 korea, english, math, avg 변수의 값을 선 그래프로 표현 
korea <- grade$korea
english <- grade$english
math <- grade$math
avg <- grade$avg
x = 1:10
xrange <- c(0, 10)
yrange <- c(60, 100)
plot(xrange, yrange, type = 'n', xlab = "학생", ylab="성적", main="kor, eng, math, avg 변수 그래프")
lines(x, korea, col='red',type = 'o', pch=1, lty=1)
lines(x, english, col='green',type = 'o', pch=2, lty=2)
lines(x, math, col='yellow',type = 'o', pch=3, lty=3)
lines(x, avg, col='blue',type = 'o', pch=4, lty=4)

legend(xrange[1],yrange[1],legned=c("korea","english","math","avg"), col=c("red","green","yellow","blue"), cex=1, pch=1:4, lty=1:4)


#7 
# 7-1 mpg데이터셋을 읽어 df_mpg에 저장하고 df_mpg 구조와 열이름을 출력
install.packages("ggplot2")
library(ggplot2)

df_mpg <- data.frame(mpg)
df_mpg

class(mpg)
dim(mpg)
colnames(mpg)

# 7-2 mpg 데이터 셋의 내용을 조사
?mpg
help(mpg)

# 7-3 df_mpg의 변수중 cyl, drv, fl의 값을 막대그래프로 표현 
par(mfrow=c(1,3))
cyl_1<-table(df_mpg$cyl)
drv_1<-table(df_mpg$drv)
fl_1<-table(df_mpg$fl)
barplot(cyl_1)
barplot(drv_2)
barplot(fl_3)

# 7-4 class 변수는 자동차의 종류를 의미한다 이변수의 값을 원그래프로 표현 하시오 
mpg_c <- class(df_mpg)
mpg_c
table

pie(mpg_c)

#7-5 hwy 변수의 값을 히스토그램으로 표현 하시오 
hist(df_mpg$hwy)

# 7-6 cty 변수와 displ 변수의 산점도를 그리고 관계를 분석
cty <- df_mpg$cty
displ <- df_mpg$displ
dd <- data.frame(cty, displ)
dd
pairs(dd, main="cty변수와 idspl변수의 관계", pch=9, col="red")

# 7-7 연료의 종류(fl)에 따른 배기량(displ)과 도시연비(cty)를 산점도로 표현, 범례추가
fl <- as.factor(df_mpg$fl)
fl_var <-as.numeric(fl)
color <- rainbow(5)
plot(displ,cty,main="연료의 종류(fl)에 따른 배기량(displ)과 도시연비(cty)",
     pch=(fl_var),col=color[fl_var])

legend("topright",legend=c("c","d","e","p","r"),
       col=color,cex=1,pch=6:11)
# 7-8 고속도로 연비(hwy)와 도시연비(cty)에 따른 배기량의 변화를 버블그래프로 표현
bubble <-sqrt(df_mpg$disp/pi)
symbols(df_mpg$hwy,df_mpg$cty, bubble, fg="white",bg="red", inches=0.3,
        main="연비와 도시연비에 따른 배기량의 변화",xlab="연비",ylab="도시연비")

# 7-9 구동방식(drv)에 따른 도시연비(cty)를 상자그림으로 표현
boxplot(formula=cty~drv,data=df_mpg,col=c("yellow","green"))