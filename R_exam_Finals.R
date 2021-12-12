# 8장 시험 
install.packages("ggmap")
library(ggmap)
# API키 등록
register_google(key = "AIzaSyB2K5QjyQTuiWTnhRfZaRoiF2Ks7iTaNK0")

# 8-3
gc <- geocode(enc2utf8('서울'))
gc
cen <- as.numeric(gc)
cen

map <- get_googlemap(center = cen)
ggmap(map)

map <- get_navermap(center = cen) # 더이상 사용 X

# 8-4 지역명으로 정보 얻기
# output에 들어갈수 있는 것이  latlon, latlona, more 이 있음 
geocode(location = '서울',
        output = 'latlona',
        soure = 'google')

# 한글 주소 얻기
geocode(location = enc2utf8(x = "서울시청&language=ko"),
        output = 'latlona',
        source = 'google')

# 지도 유형
gc <- geocode(enc2utf8('강남구청'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                    maptype = 'hybrid')
ggmap(map)
# roadmap, satellite, hybrid, terrain

# 지도의 크기설정 확 or 축
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     size = c(320,320),
                     zoom = 7)
ggmap(map)

# 지도의 색
map <- get_googlemap(center = cen,
                     size = c(320, 320),
                     zoom = 9, 
                     color = "bw")
# bw = 흑백
ggmap(map)

# extent 파라메터 설정
# panel, normal, device 
# 기본, 작게, 꽉차게 
gc <- geocode(enc2utf8('강남구'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen,
                     maptype = 'roadmap')
ggmap(map, extent = 'normal')

# 지도위 마커
gc <- geocode(enc2utf8('서울시청'))
cen <- as.numeric(gc)
map <- get_googlemap(center = cen, maptype = 'roadmap', marker = gc)
ggmap(map)

# 어러개의 마커 출력 하기
names <- c('북한산국립공원', '설악산국립공원', '오대산국립공원', '치악산국립공원', '태백산국립공원')
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names,
                 lat = gc$lat,
                 lon = gc$lon)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     marker = gc,
                     zoom = 8)
ggmap(map)

# 마커에 명칭
map1 <- ggmap(map)
map1 + geom_text(data = df,
                 aes(x = lon, y = lat),
                 size = 3,
                 label = df$name)

# 기상자료 표시
data <- read.csv('rain.csv')
gc <- geocode(enc2utf8(data$지점정보))
df <- data.frame(name = data$지점정보,
                 lon = data$경도,
                 lat = data$위도,
                 rainfall = data$강수일수)
cen <- c(mean(df$lon), mean(df$lat))
map <- get_googlemap(center = cen,
                     maptype = 'roadmap',
                     zoom = 7)
ggmap(map)
map1 <- ggmap(map)
map1 + geom_point(data = df,
                  aes(x = lon, y = lat),
                  color = 'red',
                  alpha = 0.5, # 그래프의 데이터의 투명도 
                  size = df$rainfall/40)


# 9장 
install.packages('rvest')
library(rvest)
library(xml2)

# html 문서
install.packages("curl")
library(curl)

url <- 'https://www.melon.com/chart/week/index.htm'
html <- read_html(curl(url, handle = new_handle('useragent' = 'Chrome')))
html


m_css <- html_nodes(html, css='div.ellipsis.rank01')
music_nodes <- html_nodes(m_css, 'a')
head(music_nodes)


m_xpath <- html_nodes(html, xpath = '//*[@id="lst50"]/td[6]/div/div/div[1]/span/a')
head(m_1)

# 가요제목 텍스트 추출
m_text <- html_text(music_nodes)
head(m_text, 10)

m_text2 <- html_text(m_xpath)
head(m_text2, 10)

# 아티스트 텍스트 추출 - xpath 
a_x <- html_nodes(html, xpath = '//*[@id="lst50"]/td[6]/div/div/div[2]/a')
a_t_x <- html_text(a_x)
head(a_t_x, 10)

# -css
a_c <- html_nodes(html, css = 'div.ellipsis.rank02')
a_n <- html_nodes(a_c, 'a')
a_t_c <- html_text(a_n)
head(a_t_c, 10)

# 9-9 아티스트 텍스트 추출 css수정
a_c <- html_nodes(html, css= 'div.ellipsis.rank02')
a_n <- html_nodes(a_c, ' span')
a_n1 <- html_nodes(a_n, 'a')
m_t_c <- html_text(a_n1)
head(a_t_c1)

a_t_c1 <- html_text(a_n1)
head(a_t_c1)


# 9-10 image
url <- 'https://www.melon.com/chart/week/index.htm'
img_html <- read_html(curl(url, handle = new_handle('useragent' = 'Chrome')))
img_html
img_nodes <- html_nodes(img_html, 'img')
head(img_nodes)


for(i in 3:12){
  img_src[i-2] <- html_attr(img_nodes[i],"src")
  download.file(img_src[i-2], paste("./output/img",i,".jpg",sep=""), mode = "wb")
}

# 9-11

library(xml2)
library(rvest)

url <- "https://www.google.com/search?q=%EA%B3%A0%EC%96%91%EC%9D%B4&rlz=1C1CHBD_koKR969KR974&sxsrf=AOaemvLNPNX6lyXMakx2HP19R5CdKCqjbQ:1636940839238&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjXnfbpn5n0AhVcklYBHUvoBG8Q_AUoAXoECAEQAw&biw=1920&bih=912&dpr=1"
html <- html_session(url)
head(html)
contents <- html_nodes(html, 'img')
head(contents)
img_url <- vector()
for(i in 2:21){
  img_url[i] <- html_attr(contents[i], 'src')
  print(img_url[i])
  download.file(img_url[i], paste("./image/cat",i,".jpg", sep=""), mode = "wb")
}
