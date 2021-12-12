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

