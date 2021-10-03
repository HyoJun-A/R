# p.108 2번
#1. 4의 배수의 합
i <- 1
sum <- 0
for(i in 1:100){
  if(i%%4==0){
    sum <- sum+i
  }
}
print(sum)

i <- 1
sum <- 0
while(i <= 100){
  if(i%%4==0){
    sum <- sum+i
  }
  i <- i+1
}
print(sum)

#2. 짝수의 합
i <- 1
sum <- 0
for(i in 1:100){
  if(i%%2==0 & i%%4!=0){
    sum <- sum+i
  }
}
print(sum)

i <- 1
sum <- 0
while(i <= 100){
  if(i%%2==0 & i%%4!=0){
    sum <- sum+i
  }
  i <- i+1
}
print(sum)

#3. 1~100의 숫자의 곱 단 3의배수는 제외
i <- 1
sum <- 1
for(i in 1:100){
  if(i%%3==0){
    next
  }
  sum <- sum*i
}
print(sum)

i <- 1
sum <- 1
while(i <= 100){
  if(i%%3!=0){
    sum <- sum*i
  }
  i <- i+1
}
print(sum)

#4. 1~100 사이의 숫자의 곱, 곱셈의 값이 10000이 넘을경우 멈추기
i <- 1
mul <- 1
for(i in 1:100){
  mul <- mul*i
  if(mul > 10000){
    break
  }
}
print(mul)

i <- 1
mul <- 1
while(i <= 100){
  mul <- mul*i
  if(mul > 10000){
    break
  }
  i <- i+1
}
print(mul)

#5. for문과 while문을 사용하여 구구단 
i <- 1 # i의 시작을 1로 시작값을 정의 한다. 
while(i <= 9) 
{
  cat(i, "단 입니다.\n") #print가 아닌 cat을 사용함으로서 i를 문자열과 같이 사용할수 있다.
  for(j in 1:9)
  {
    print(i*j)
  }
  i <- i+1 # 만약 i+1를 하지 않는다면 무한하게 반복하기 떄문에 사용한다.
}

# p.108 3번문제
#1. 최대값을 반환
myMax <- function(x, y){
  result <- max(x, y)
  return(result)
}
myMax(2,-5)

#2. 평균을 반환하는 함수 myAvg()
x <- c(1, 2, 3, 4, 5)
myAvg <- function(m){
  result <- mean(m)
  return(result)
}
myAvg(x)

#3. 평균과 표준편차를 구하는 함수  myStat()
x <- c(10, 20, 30, 40, 50)
myStat <- function(w){
  mean <- mean(w)
  sd <- sd(w)
  return(c(mean=mean, sd=sd))
}
myStat(x)

# p.109 4번 문제
#1. 데이터 구조타입 출력
str(quakes)
#2.데이터의 차원, 행의 수와 열의 수
dim(quakes)
nrow(quakes)
ncol(quakes)
#3. 열의 이름
colnames(quakes)
#4. 타입과 열정보
str(quakes)
#5. 데이터의 요약 통계량
summary(quakes)
#6 데이터의 처음 10행과 마지막 10행의 내용
head(quakes, n=10)
tail(quakes, n=10)


#p.109 5번 문제
#1. 행별 합계
rowSums(df_x)

#2. 열별 평균
apply(df_x, 2, mean)

#3. 열별 최대값
apply(df_x, 2, max)

#4. 열별 표준편차
apply(df_x, 2, sd)

#p. 135 문제 2번
# 2-1 데이터 프레임 작성
height <- c(58, 59, 60, 61, 62) 
weight <- c(115, 117, 120, 123, 126)
health <- data.frame(height, weight) #height, weight데이터를 데이터프레임으로 작성
print(health)

# 2-2 데이터 프레임 'health' 를 'health.txt' 파일로 저장하시오 
getwd() #저장할 데이터 위치 확인
setwd("D:/R/R_study") #저장할 위치 지정 
getwd()
write.table(health,file="health.txt", quote = FALSE) 
#health 데이터프레임을 txt파일로 저장, quote를 사용하여 큰따옴표를 삭제제 
read.table("health.txt")

# 2-3 txt파일을 csv 파일로 저장 
write.csv(health, file="health.csv", quote = FALSE)
#health 데이터프레임을 csv파일로 저장장
read.csv("health.csv")

# 2-4 xlsx파일로 저장
install.packages("writexl")
library(writexl)
write_xlsx(health, path="health.xlsx")

# 2-5 변수에 저장하고 내용 확인
health_txt <- read.table('health.txt')


#2-6 class함수를 이용해 데이터 타입을 확인
class(health_txt)

#2-7
health_csv <- read.csv('health.csv')

#2-8 health_csv 데이터 타입을 확인
class(health_csv)

#2-9
health_csv
health_csv<- subset(health_csv, select=-c(X))
health_csv

#2-10
install.packages("readexl")
library(readexl)

health_xlsx <- read.xlsx('health.xlsx')

#2-11
class(health_xlsx)

#p.136번 3번 문제
#3-1
var1 <- scan(what="")
var1

#3-2
var2 <- readLines(encoding = "UTF-8" )
var2

#3-3
link_var1 <- paste(var1, collapse = " ")
link_var1

#3-4
slpit_var2 <- strsplit(var2, split =" ")
slpit_var2

#3-5
nchar(var1)
nchar(var2)
nchar(link_var1)

nchar(slpit_var2)

#3-6
substr(link_var1, 0, 1) <- "U" 
link_var1

substr(var2, 0, 1) <- "U"
var2

#3-7
total_var2 <- paste(var2, link_var1)
total_var2

#3-8
grep("U", link_var1, )

#3-9
grep("I", var1, invert = TRUE)
grep("I", slpit_var2, invert = TRUE)

#3-10
totla_var <- gsub(pattern="U", replacement="I", total_var2)
totla_var
