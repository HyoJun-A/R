# chapter 10 워드 클라우드
# 10-1 워드클라우드에 필요한 패키지 설치
install.packages('tm')
install.packages('Snowball')
install.packages('wordcluod')
install.packages('RColorBrewer')

# 10-2 패키지 로드 및 파일 읽기 
library(tm)
library(SnowballC)
library(RColorBrewer)
library(wordcloud)

readtxt <- readLines("trump.txt")

# 10-3 데이터 정재 (데이터 정제의 순서가 중요하다.)
# Corpus 생성
txt <- Corpus(VectorSource(readtxt))

# 내용확인
inspect(txt)

# 데이터 정제
# 공백 제거
txt <- tm_map(txt, stripWhitespace)

# 소문자로 변경
txt <- tm_map(txt, tolower)

# 숫자 제거
txt <- tm_map(txt, removeNumbers)

# 불용어 제거
txt <- tm_map(txt, removeWords, stopwords("english"))

# 구두점 제거
txt <- tm_map(txt, removePunctuation)

# 어근 추출
txt <- tm_map(txt, stemDocument)

# 10-4 DTM 생성 및 단어의 데이터 프레임 생성
# DTM생성
dtm <- DocumentTermMatrix(txt)

# 행렬로 변환
mat_DTM = as.matrix(dtm)

# 단어의 빈도에 의한 내림차순정렬
sort_mat_DTM = sort(colSums(mat_DTM), decreasing = TRUE)

# 데이터 프레임 생성
word_df = data.frame(word=names(sort_mat_DTM), freq=sort_mat_DTM)

# 10-5 단어의 빈도 막대그래프
library(ggplot2)
library(dplyr)
word_df %>%
  filter(freq>3) %>%
  ggplot(aes(reorder(word,freq), freq))+
  geom_col() +
  xlab(NULL) +
  coord_flip()

# 10-6 단어의 워드클라우드
wordcloud(words = word_df$word,
          freq = word_df$freq,
          max.words = 100,
          random.order = FALSE,
          rot.per = 0.35,
          colors = brewer.pal(8, "Dark2"))
