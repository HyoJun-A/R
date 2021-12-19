# Chapte 02
#2.1 변수와 데이터형
7-3
5*6+4

#2-2
x <- 7
y <- 3
x-y -> z
z

#2-6
1:5
v1 <- 1:5
v1
v2 <- 5:-5
v2

# 2-9 rep()함수
v1 <- rep(1:3, times=2)
v1

v1 <- rep(1:3, each=3)
v1

# 2-10 벡터의 값 추출
# R은 인덱스가 1부터 시작한다.
v1 <- c(10,20,30,40,50)
v1
v1[1]
v1[2]
v1[0]  #numeric(0)은 벡터의 길이가 0인 벡터를 의미 한다.
v1[6]

# 벡터에서 원하지 않는 값을 제외시키고 추출할 경우 '-'를 사용한다.

# 2-11 벡터 내 여러 개의 값 추출출
v1
v1[1:3]
v1[c(1,3,5)]
v1[seq(1,5,2)]
v1[-3]

#팩터
# 문자형 데이터를 저장할 수 있는 벡터의 한 종류로 범주형 데이터를 표현할 떄 사용
# 범주형 데이터란?
# 성별, 혈액형, 꽃의 품종 등과 같이 미리 고정된 유형으로 분류된 데이터인 경우를 뜻함함

# 2-19 팩터 생성 예
x = c('male', 'female', 'male', 'female', 'female')
x
class(x)
glevel = c('male', 'female')
glevel
class(glevel)
gender1 <- factor(x, level=glevel)
gender1
class(gender1)

#범주형 벡터와 레벨 벡터를 factor()함수에 직접 적용용
gender2 <- factor(c('male', 'female', 'female', 'female', 'male'))
gender2
class(gender2)

#팩터 생성 시 레벨을 생략한 경우: 범주형 벡터를 이용해 자동 생성 
gender3 <- factor(c('male', 'female', 'female', 'female', 'male'))
gender3
class(gender3)

#2-20 팩터 함수 예
nlevels(gender1) #nlevers() 팩터에서 레벨의 개수를 반환
levels(gender1)  #levers() 팩터에서 레벨의 목록을 반환환
is.factor(gender1) #is.factor() 주어진 값이 팩터인지를 판단

#2-21
gender3[7] <- "girl" # 레벨에 없는 값을 삽입할 경우 에러가 발생한다.
gender3

levels(gender3) <- c("male", "female", "girl")
gender3[6:7] <- "girl"
gender3

# 펙터의 숫자 데이터 변경
#  as.integer()함수를 사용하여 문자값을 숫자값으로 변경하여 사용한다.
levels(gender3)
as.integer(gender3)

# 메트릭스
# 메트릭스는 2차원 행렬이라고 생각하면 된다.
# matrix(x, nrow =행의 수, nclo =열의 수)
x <- matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2)
x

x1 <- matrix(c(1,2,3,4,5,6), 3, 2)
x1

x2 <- matrix(c(1,2,3,4,5,6), 3) #nrow 행만 지정해도 자동으로 nclo열이 지정된다.
x2 

x3 <- matrix(c(1,2,3,4,5,6), ncol=2) #ncol 열만 지정도해 자동으로 nrow행이 지정된다. 
x3

# 이미 생성된 벡터를 이용하여 새로운 매트릭스를 생성하고 싶다면 rbind()함수와 cbind()함수를 사용하면 된다.
# rbind()함수 : 행으로 결합하여 매트릭스를 만든다.
# cbind()함수 : 열로 결합하여 매트릭스를 만든다.

# 2-25 벡터를 이용해서 매트릭스 만들기
a <- seq(10,50,10)
a

b <- seq(60, 100, 10)
b

c <- seq(110, 150, 10)
c

x <- rbind(a, b)
x

x1 <- rbind(a, b, c)
x1

x2 <- rbind(x, x1)
x2

x3 <- rbind(a, x1)
x3

y <- cbind(a, b)
y

y1 <- cbind(a, b, c)
y1

y2 <- cbind(y, y1)
y2

# R은 매트릭스의 행과 열에 이름을 부여할수 있는 rownames() 와 colnames()라는 함수를 제공 한다.

 x <- matrix(seq(1:15), 3, 5)
x 
rownames(x) <- c("first", "second", "third")
colnames(x) <- c("t1", "t2", "t3", "t4", "t5")
x

rownames(x)
colnames(x)

ncol(x)
nrow(x)

dim(x)
x
x[1, 3]
x[2, 2:4]

# 배열
# 배열은 2차원 이상의 동일한 타입의 데이터를 저장하는 구조

x = array(1:24, c(3,2,4))
x
dim(x)
dimnames(x) <- list(c(1,2,3), c(1,2))
x

dim(x)

x[1,2,1] #매트릭스 1의 1행 2열의 값

# 데이터 프레임
# >대량 데이터에 많이 사용한다.
# > 서로 다른 타입의 데이터를 2차원 테이블 형태로 저장한다.

name <- c("김철수", "이수지", "유소영", "장일순")
name

kor <- c(96, 94, 84, 67)
kor

eng <- c(97, 92, 85, 79)
eng

math <- c(93, 88, 86, 68)
math

grade <- factor(c("A", "A", "B", "C"))
levels(grade)

score <- data.frame(name, kor, eng, math, grade, stringsAsFactors = FALSE)
score

score1 <- data.frame(name=c("김철수", "이수지", "유소영", "장일순"), kor=c(96, 94, 84, 67), eng=c(97, 94, 84, 67), math=c(93, 88, 86, 68), grade=factor(c("A", "A", "B", "C")), stringsAsFactors = FALSE)
score1

rownames(score)
colnames(score)
dim(score)

nrow(score)
ncol(score)

score

number <- c("202101", "202102", "202103", "202104")
number

score <- cbind(score, number, stringsAsFactors = FALSE)
score

t5 <- c("곽거병", 100, 100, 100, "A", "202105")
t5
score <- rbind(score, t5, stringsAsFactors = FALSE)
score

score$name
score$kor
score$number

score[1,]

score[score$name=="곽거병", c("kor", "eng")]

# 리스트
# 벡터, 매트릭스, 배열, 데이터프레임 등과 같은 서로 다른 구조의 데이터를 모두 포함하는 데이터를   1차원으로 저장

#2-34
data1 <- 1:4
data2 <- matrix(1:6, 3, byrow=TRUE)
data3 <- array(1:24, c(3,4,2))
data4 <- data.frame(id =c(1,2,3,4), name=c("LEE", "PARK", "KIM", "SHIN"))

list1 <- list(data1, data2, data3, data4)
list1


list2 <- list(data1=data1, data2=data2, data3=data3, data4=data4)
list2

list2$data1

list2$data4
