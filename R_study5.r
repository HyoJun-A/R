# 제 4장 입출력과 문자열
# p.117
data <- read.table("grade.csv", sep = ",")
data

# 행 이름을 벡터로 만들어서 지정
r_name <- c("st1", "st2", "st3", "st4", "st5", "st6", "st7", "st8", "st9", "st10")
data <- read.table("grade.csv", sep = ",", header = TRUE, row.names = r_name)
data
#행이름을 파일 내의 열 이름(ID)중 하나로 저장
#data <- read.table("grade.csv", sep=",", header=TRUE, row.name = "ID" )
#skip 파라미터 사용 : header를 읽지 않고 건너 뛰어 데이터부터 읽는다.
data1 <- read.table("grade.csv", sep=",", row.names = r_name, skip=1)
data1

data1 <- read.csv("grade.csv")
data1
data1 <- read.csv("grade.csv", sep=" ")
data1
data2 <- read.csv("grade_space.txt", sep=" ")
data2

write.table(data1, file = "table1.txt")
write.table(data1, file="table2.txt", quote=TRUE)
write.table(data1, file = "table3.txt", sep = ',', quote=FALSE)

# 엑셀 파일 읽고 쓰기
install.packages("readxl")
library(readxl)
data <- read_excel("grade.xlsx") #엑셀파일을 불러와 data에 저장
data

#변수명이 없는 경우 엑셀파일 읽기 
data1 <- read_excel("grade_nocol.xlsx", col_names = F)
data1

# sheet 파라미터를 이용해서 엑셀파일 읽기 
# shheet를 지정 하여 엑셀의 원하는 시트를 지정할 수 있다.
data2 <- read_excel("grade_sheet.xlsx", sheet = 2)
data2

# 데이터를 엑셀파일로 저장하기 
install.packages("writexl")
library(writexl)
write_xlsx(data2, "write_grade.xlsx")

# 문자열 함수 
string1 <- "I LOVE R"
string1
string2 <- c("I", "LOVE", "R")
string2

nchar(string1)
nchar(string2)

#paste 함수 사용하여 문자 합치기 
paste("I", "LOVE", "R")
paste("I", "LOVE", "R", sep = "-")

#script 함수로 문자열 분리하기
str <- c("I LOVE R")
str
strsplit(str) #split 파라미터가 없어서 에러
strsplit(str, split = "") #split이 ""이므로 한 문자씩 분리
strsplit(str, split = " ")

name <- c("Michle, Jordan" , "Julia, Robert", "Nicole, Kidman")
name
sp_name <- strsplit(name,split=",")
sp_name

#분리된 문자열 중 일부를 추출
first <- c(sp_name[[1]][1], sp_name[[2]][1], sp_name[[3]][1])
first
path <- "/home/first/data/test.txt"
path
st_path <- strsplit(path, split = "/") #"/"를 기준으로 분리 
st_path
