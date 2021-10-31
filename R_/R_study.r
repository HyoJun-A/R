#1. 교과서 108-109쪽 연습문제 2-5번
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

#2. 교과서 135-136쪽 연습문제 2-3번
# 2-1 데이터 프레임 작성
height <- c(58, 59, 60, 61, 62) 
weight <- c(115, 117, 120, 123, 126)
df <- data.frame(height, weight) #height, weight데이터를 데이터프레임으로 작성
print(df)

# 2-2 데이터 프레임 'height' 를 'height.txt' 파일로 저장하시오 
getwd() #저장할 데이터 위치 확인
setwd("C:/Users/82104/Documents/R") #저장할 위치 지정 
getwd()
write.table(df,file="height.txt", quote = FALSE) 
#df 데이터프레임을 txt파일로 저장, quote를 사용하여 큰따옴표를 삭제제 
read.table("height.txt")

# 2-3 txt파일을 csv 파일로 저장 
write.csv(df, file="height.csv", quote = FALSE)
#df 데이터프레임을 csv파일로 저장장
read.csv("height.csv")
