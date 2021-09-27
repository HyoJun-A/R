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
