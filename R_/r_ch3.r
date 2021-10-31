# P.88 3-4 다중 if-else문을 이용한 혈액형 판별 
blood <- 'B'
if(blood == 'A'){
  print("혈액형은 A형")
 } else if(blood == 'B'){
  print("혈액형은 B형")
 } else if(blood == 'AB'){
  print('혈액형은 AB형')
 } else {
  print("혈액형은 O형")
 }

# p.89
x <- 10
even <- ifelse(x%%2 == 0, 'x는 짝수', 'x는 홀수')
print(even)

# p.90
for(i in 1:5){
  print('x')
}

sum <- 0
for(i in 1:10){
  sum <- sum+i
  print(sum)
}

# p. 92
data <- mtcars
class(data)
ncol(data)
colnames(data)
c_name <- colnames(data)
class(c_name)
for( name in c_name){
  print(name)
}

# p.94
sum <- 0
i <- 1
while(i <= 10){
  sum <- sum+i
  print(sum)
  i <- i+1
}

add <- function(x, y){
  result <- x+y
  return(result)
}
z <- add(3, 5)
print(z)

calc <- function(x, y = 5){
  add <- x+y
  sub <- x-y
  mul <- x*y
  div <- x/y
  return (list(add = add, sub = sub, mul = mul, div = div))
}
result1 <- calc(3, 5)
print(result1)

add <- result1$add
sub <- result1$sub
mul <- result1$mul
div <- result1$div
cat('add:', add, 'sub;', sub, 'mul:', mul, 'div:', div)

clac <- function(x,y = 5){
  add <- x+y
  sub <- x-y
  mul <- x*y
  div <- x/y
  return(c(add=add, sub=sub, mul=mul, div=div))
}
result2 <- clac(3, 5)
print(result2)

dim(mtcars)
nrow(mtcars)
ncol(mtcars)
colnames(mtcars)
rownames(mtcars)
head(mtcars)
tail(mtcars)
str(mtcars)
summary(mtcars)

is.matrix(mtcars)
is.data.frame(mtcars)
x <- matrix(1:15, 3, 5)
class(x)
df_x <- as.data.frame(x)
class(df_x)

x <- cbind(x1 = 3, x2 = c(4:1, 2:5))
col.sums <- apply(x, 2, sum)
col.sums
row.sums <- apply(x, 1, sum)
row.sums

scan("data1.txt")
scan("data2.txt")
scan("data3.txt", "what=")
scan("data4.txt", "what=")

x <- 1
y <- 2
print(x,y)
z<-c(1, 2, 3, 4, 5)
print(z)
print(z^2)

x<-c(1,2,3)
s <-"document"
cat("abc", 123, "string")
cat("test",x,s)
cat("agin\n", 100, '\n')

data <- read.table("grade.csv", sep=',')
data

r_name <- c("st1", "st2","st3","st4","st5", "st6", "st7", "st8", "st9", "st10")
data <- read.table("grade.csv", sep=',', header=TRUE, row.names = r_name)
data

data1 <- read.table("grade.csv", sep=',', header = TRUE, row.names = "ID")
data1

data2 <- read.table("grade.csv", sep=',', row.names = r_name, skip=1)
data2
