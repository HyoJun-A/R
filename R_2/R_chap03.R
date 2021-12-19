# 3장 연습문제
# p.108
# 2
# 2-1
a=0
for(i in 1:100){
  if(i%%4==0){
    a <- a+i
  }
}
print(a)

a=0
i=1
while(i <= 100){
  if(i%%4==0){
    a <- a+i
  }
  i <- i+1
}
print(a)

# 2-2
b=0
for(i in 1:100){
  if(i%%2==0 && i%%4!=0){
    b <- b+i
  }
}
print(b)

i=1
b=0
while(i <= 100){
  if(i%%2==0 & i%%4!=0){
    b <- b+i
  }
  i <- i+1
}
print(b)

#2-3
c=1
for(i in 1:100){
  if(i%%3==0){
    next
  }
  c <- c*i
}
print(c)

i=1
c=1
while(i <= 100){
  i <- i+1
  if(i%%3==0) next
  c <- c*i
  
}
print(c)

# 2-4
d=1
for(i in 1:100){
  if(d > 10000){
    break
  }
  d <- d*i
}
print(d)

i = 1
d = 1
while(i <= 100){
  
  if(d > 10000) break
  d <- d*i
  i <- i+1
}
print(d)

#2-5
i = 1
while(i <= 9){
  cat(i,"단 입니다.\n")
  for(j in 1:9){
    
    print(i*j)
  }  
  cat('--------------\n')
  i <- i+1
}

#3
# 3-1
myMax <- function(x,y){
  result <- max(x,y)
  return(result)
}
myMax(1, 3)

#3-2
myAvg <- function(x){
  result <- mean(x)
  return(result)
}
x <- c(1, 2, 3, 4, 5)
myAvg(x)

#3-3
myStat <- function(x){
  result <- c(mean(x), sd(x))
  return(result)
}

x <- c(10, 20 ,30, 40, 50)
myStat(x)

#4
#4-1
class(quakes)

#4-2
dim(quakes)
nrow(quakes)
ncol(quakes)

#4-3
colnames(quakes)

#4-4
str(quakes)

#4-5
summary(quakes)

#4-6
head(quakes, n=10)
tail(quakes, n=10)

#5
#5-1
apply(quakes, 1, sum)

#5-2
apply(quakes, 2, mean)

#5-3
apply(quakes, 2, max)

#5-4
apply(quakes, 2, sd)
