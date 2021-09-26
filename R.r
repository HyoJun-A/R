3+2
x <-7
y <-3
x-y ->z
z
#변수명의 첫 글자는 영문자와 마침표(.)로 시작해야 한다.
x1_ <-7
x1_
.info <-5
.info
_x1 <-7
_x1
x<-5
x
y<-3
y
z<-x/y
z
c<-2+5i
c
str<-"Hello"
str
kind<-factor(c('male','female'))
kind
lo <-TRUE
lo
n1<-5/0
n1
?Syntax
1:5
v1<-1:5
v1
v2<-5:-5
v2
#벡터 > 변수안에 데이터를 퉁쳐서 큰 집합으로 생각
v1 <- c(1,2,3)
v1
# c > combine(결합, 묶는다)
v1 <- seq(from=1, to=5, by=1)
v1
v1 <- c(5,10,15,20,25,30)
v1
v1[1] <- -5
v1
v1[2:3] <- c(-10, -15)
v1
v1[c(2,4)] <- c(40, 50)
v1
v1[c(2,4)]
v1 <- 1:5
v1
v1*3
v1
v1
v1*3
v1-3
v2 <- v1+10
v2
x = c('male', 'female', 'female', 'female', 'male')
x
class(x)
glevel=c('male', 'female')
glevel
class(glevel)
gender1 <- factor(x, levels = glevel)
gender1
class(gender1)
gender2 <- factor(c('male', 'female', 'female', 'female', 'male'), c('male', 'female'))
gender2
class(gender2)
gender3 <- factor(c('male', 'female', 'female', 'female', 'male'))
gender3
class(gender3)
#데이터프레임

#2-30 데이터 프레임 만들기 
name <- c("김철수", "이수지", "유소영", "장일순")
kor <- c(96, 94, 84, 67)
eng <- c(97, 92, 85, 79)
math <- c(93, 88, 86, 68)
grade <- factor(c("A", "A", "B", "C"))
score <- data.frame(name,kor,eng,math, grade, stringsAsFactors = FALSE)
score
