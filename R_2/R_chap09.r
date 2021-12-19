# chatper 09 웹스크래핑과 공공데이터 활용하기 

# 9-1 rvest 패키지 설치 및 로드
install.packages('rvest')
library(xml2)
library(rvest)

# 9-2 html 문서 가져오기
url <- 'https://www.melon.com/chart/week/index.htm'
html <- read_html(url)

# 9-3 html 문서 가져오기 
install.packages('curl')
library(curl)
url <- 'https://www.melon.com/chart/week/index.htm'
html <- read_html(curl(url, handle = new_handle("useragent" = "Chrome")))
html

# 9-4 css값을 이용한 [가요제목]노드 추출
# lst50 > td:nth-child(6) > div > div > div.ellipsis.rank01 > span > a
music_contents <- html_nodes(html, css='div.ellipsis.rank01')
music_nodes <- html_nodes(music_contents, 'a')
head(music_nodes)

# 9-5 xpath 값을 이용한 노드 추출
# //*[@id="lst50"]/td[6]/div/div/div[1]/span/a
music_contents1 <- html_nodes(html, xpath='//*[@id="lst50"]/td[6]/div/div/div[1]/span/a')
head(music_contents1)

# 9-6 가요제목 텍스트 추출
music_text_css <- html_text(music_nodes)
head(music_text_css, 10)

music_text_xpath <- html_text(music_contents1)
head(music_text_xpath, 10)

# 9-7 아티스트 텍스트 추출 - xpath
artist_contents1 <- html_nodes(html, xpath = '//*[@id="lst50"]/td[6]/div/div/div[2]/a')
artist_text_xpath <- html_text(artist_contents1)
head(artist_text_xpath, 10)

# 9-8 아티스트 텍스트 추출-css
artist_contents <- html_nodes(html, css='div.ellipsis.rank02')
artist_nodes <- html_nodes(artist_contents, 'a')
artist_text_css <- html_text(artist_nodes)
# css로 실행 할 경우 이름이 두번 반복하는 것을 볼 수 있다.
# css로 실행 할 경우  select의 코드를 살펴 보면 이름이 두번 반복한다
head(artist_text_css, 10)

# 9-9 아티스트 텍스트 추출 -css-수정
artist_contents <-html_nodes(html, css='div.ellipsis.rank02')
artist_nodes <- html_nodes(artist_contents, 'span')
artist_nodes1 <- html_nodes(artist_nodes, 'a')
musci_text_css1 <- html_text(artist_nodes1)
head(artist_text_css1, 10)

artist_text_css1 <- html_text(artist_nodes1)
head(artist_text_css1, 10)
# 한번에 하는 법
artist_text_css3=html %>% html_nodes('.ellipsis') %>% html_text(trim=TRUE)


# 9-10
img_html <- read_html(curl(url, handle = new_handle("useragent"="Chrome")))
img_html
img_nodes <- html_nodes(img_html, 'img')
#head를 사용했을때 나오는 결과에서 3번째 줄부터 진짜 이미지
head(img_nodes)

# 9-11 앨범 이미지 저장하기
# output 폴더를 생성 해주어야 함
# wb는 이진 파일 , w 텍스트 파일
img_src = vector()
for(i in 3:12){
  img_src[i-2] <- html_attr(img_nodes[i],"src")
  download.file(img_src[i-2], paste("./output/img",i,".jpg",sep=""), mode = "wb")
}

# 9-12 구글에서 고양이 이미지 스크래핑하기
# google 이미지 검색 url
url <- "https://www.google.com/search?q=%EA%B3%A0%EC%96%91%EC%9D%B4&rlz=1C1CHBD_koKR969KR974&sxsrf=AOaemvLNPNX6lyXMakx2HP19R5CdKCqjbQ:1636940839238&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjXnfbpn5n0AhVcklYBHUvoBG8Q_AUoAXoECAEQAw&biw=1920&bih=912&dpr=1"
html <- html_session(url)
head(html)
contents <- html_nodes(html, 'img')
head(contents)
img_url = vector()
for(i in 2:21){
  img_url[i] <- html_attr(contents[i], "src")
  print(img_url[i])
  download.file(img_url[i], paste("./cat_out/cat",i, ".jpg", sep=""), mode = "wb")
}

