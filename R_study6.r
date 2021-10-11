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
barplot(grade_data~grade$name)

# 6-3 파이 챠트

# 6-4 
hist(n)
