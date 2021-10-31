# Chapter 5 데이터 기초분석과 요약하기

# mtcars 데이터셋
class(mtcars) # mtcars의 구조 확인하기 
dim(mtcars) # 행과 열의 확인
str(mtcars) # 데이터의 속성확인
head(mtcars) #데이터의 일부 출력
summary(mtcars) #데이터의 요역통계량량

stem(mtcars$mpg) #데이터의 분포 확인 

# mpg 데이터의 히스토그램 구하기 
mpg <- mtcars$mpg
hist(mpg) # hist() : 히스토그램 그래프 함수 
# breaks : 히스토그램 계급의 구간 main : 그림의 제목 xlab : x축 제목 ylab : y축 제목 
hist(mpg, breaks=seq(10, 34, by=6), main="mpg의 히스토그램", xlab="연비", ylab="측정값값", col=rainbow(4))

# gear의 수에 의한 데이터 관측 
mtcars$gear # gear의 값이 3, 4, 5의 값을 갖는다 
gear <- table(mtcars$gear) #gear 의 빈도 구하기
gear
#막대그래프 그리기 
barplot(gear, main="gear의 수에 의한 자동차의 수", col=rainbow(length(gear)), xlab="gear", ylab="자동차의 수 ")

#수평 막대그래프 그리기 
barplot(gear, main="gear의 수에 의한 자동차의 수", col=rainbow(length(gear)), xlab="gear", ylab="자동차의 수 ", xlim=c(0, 16), horiz=TRUE) 
# horiz = TURE 일경우 수평 막대그래프가 그려진다, xlim(), ylim() : x, y값의 범위 지정 

# 파이챠트 그리기 
gear <- table(mtcars$gear)
pct <- round(gear/sum(gear)*100.0) # gear의 %값 계산
# pie 챠트에 표시할 레이블 값 생성
for(i in 1:length(gear)){
  gear_lable[i] <- paste("gear",as.character(i+2),':',pct[i],"%")
}
gear_lable
pie(gear, main="gear의 수에 의한 자동차의 점유율", labels=gear_lable, col=rainbow(length(gear)))

# 자동차 중량에 따른 연비 구하기 
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt,mpg,main="자동차 중량에 따른 연비", xlab="중량",ylab="연비",pch=1,col='green',bg='red',cex=1.5)
