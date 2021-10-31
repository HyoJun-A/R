mycin <- as.data.frame(Puromycin)
head(mycin)
summary(mycin)

# 결측치 데이터 생성 
mycin[2,1] <- NA
mycin[5,2] <- NA
mycin[7,3] <- NA
head(mycin,7)

# 결측치 확인 
is.na(mycin) #데이터 프레임 전체의 결측치 확인
is.na(mycin$conc) # 특정 열의 결측치 확인
is.na(mycin[1:5,]) # 특정 행의 결측치 확인 

# 결측치 개수 확인 
sum(is.na(mycin))
sum(is.na(mycin$conc))
table(is.na(mycin))
table(is.na(mycin$conc))

sum(mycin$conc)
sum(mycin$conc, na.rm = TRUE)

head(mycin$conc)
mycin$conc[is.na(mycin$conc)]=0
head(mycin$conc)

head(mycin$rate)
mycin$rate[is.na(mycin$rate)]=mean(mycin$rate, na.rm=T)
head(mycin$rate)

orange <- as.data.frame(Orange)
head(orange)
str(orange)
summary(orange)

table(orange$age)
orange$age[10] <- 1100
orange$age[20] <- 2000
table(orange$age)

orange$age <- ifelse(orange$age == 1100 | orange$age==2000, NA, orange$age)
table(orange$age)
table(is.na(orange$age))

install.packages("dplyr")
library(dplyr)
mtcar1 <- mtcars
head(mtcar1)

select(mtcar1, mpg, cyl, vs)
select(mtcar1, -am, -gear, -carb)

select(mtcar1, mpg, cyl, vs)
select(mtcar1, -am, -gear, -carb)
colnames(mtcar1)
filter(mtcar1, cyl==6)

filter(mtcar1, mpg>21)

filter(mtcar1, gear==4 & mpg>21)
filter(mtcar1, gear==3 | gear == 5)

mtcar1 %>% filter(gear==4) %>% select(mpg, cyl, disp)

mtcar1 %>% filter(mpg>21) %>% select(disp, hp, wt)

slice(mtcar1, 3:7)

mtcar1 %>% arrange(mpg)

mtcar1 %>% arrange(desc(mpg))

mtcar1 %>% arrange(cyl, mpg)

mtcar1 %>% distinct(cyl)
mtcar1 %>% distinct(cyl, gear)

duplicated(mtcar1$cyl)

table(duplicated(mtcar1$cyl))

mtcar1 %>% mutate(sec=qsec*4) %>% head
mtcar1 %>% mutate(valid = ifelse(mpg>=mean(mpg), "pass", "fail")) %>% head

mtcar1 %>%
  filter(am==0) %>%
  select(mpg, hp, wt) %>%
  arrange(desc(mpg)) %>%
  head
