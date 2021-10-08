# P. 81 2장 연습문제

# 8
# 8-1
a <- 1:100
b <- 101:200
a
b

# 8-2
a+b

#8-3
a_even <- a[a%%2==0]
a_even

#8-4
b_3times <- b[b%%3==0]
b_3times

#8-5
a[a > 40 & a < 70]

#8-6
sum(b)

#8-7
min(a)
max(a)

#8-8
b[b%%5==0]*2

# 9
#9-1
m <- matrix(1:20, 4, 5, byrow = TRUE)
m

#9-2
rownames(m) <- c("row1", "row2", "row3", "row4")
m
colnames(m) <- c("col1", "col2", "col3", "col4", "col5")
m

#9-3
row5 <- c(21, 22, 23, 24, 25)
row5
m <- rbind(m, row5)
m

# 9-4
m[1:5, 1:2]

m[2:3, 1:5]

#9-5
nrow(m)
ncol(m)
dim(m)

#10
#10-1
d <- data.frame(name=c("john", "mary", "henry", "jane", "tommy"), height=c(178.9, 167.8, 170.5, 153.2, 172.1), weight=c(73.2, 58.3, 68.7, 50.4, 70.3),gender=factor(c("male", "female", "male", "female", "male")), stringsAsFactors = FALSE)
d

#10-2
blood <- factor(c("A", "O", "A", "AB", "B"))
d <- cbind(d, blood)
d
#10-3
rownames(d) <- c("std1", "std2", "std3", "std4", "std5")
d

#10-4
d[,c("name","blood")]

#10-5
dim(d)
nrow(d)
ncol(d)

#10-6
d[4:5,]

#d[d$name=="jane"&d$name=="tommy",]

#10-7
d[d$weight > 65, "name"]
factor(d$gender)
#10-8
d[d$gender=="male" & d$blood=="A",]

#11
#11-1 
list_std <- list(student=d, ID=c("200001", "200002", "200003", "200004", "200005"))
list_std

#11-2
list_std[1]

#11-3
list_std$student[list_std$student$name=="henry",]
