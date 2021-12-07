# R 08장
# ggmap 패키지 설치 및 로드 
install.packages("ggmap")
library(ggmap)

# google API 키 등록
register_google(key="AIzaSyB2K5QjyQTuiWTnhRfZaRoiF2Ks7iTaNK0")

#get_map, get_googlemap은 위도와 경도를 보여줌 
#get_map 의 파라미터는 location
map <- get_map(location = "서울")
ggmap(map)

#get_googlemap 의 파라미터는 center
map1 <- get_googlemap(center="서울")
ggmap(map1)

# qmap은 좌표값이 없다 .
qmap("서울")

#"서울"의 위도와 경도를 이용하여 지도 출력하기
#enc2utf8()함수를 사용하여 한글을 사용할 수 있다.
gc <- geocode(enc2utf8("서울"))
gc

cen <- as.numeric(gc)
cen

map <- get_googlemap(center=cen)
ggmap(map)
mpa <- get_googlemap(center = cen)
ggmap(map)

# geocode() 함수의 파라메터에 따른 출력결과
#지역명으로 위도와 경도 좌표 얻기
geocode(location = '서울시청',
        output='latlon',
        source='google')
#지역명으로 위도와 경도 좌표 및 주소 열기 
geocode(location = '서울시청',
        output='latlona',
        source='google')

# 한글 주소를 얻는 방법
#enc2utf8() 함수에 지역명과 &language=ko를 붙여서 지정 
geocode(location = enc2utf8(x = "서울시청&language=ko"),
        output='latlona',
        source='google')

# 지역명으로 위도, 경도, 동서남북 끝점, 주소 국가등 얻기 
geocode(location = '서울시청',
        output='more',
        source='google')

# get_googlemap()함수의 네가지 지도 유형
gc <- geocode(enc2utf8("강남구"))
gc
cen <- as.numeric(gc)
cen
map <- get_googlemap(center=cen, maptype = "terrain")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "satellite")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "roadmap")
ggmap(map)
map <- get_googlemap(center=cen, maptype = "hybrid")
ggmap(map)

# 지도의 크기설정 및 확대와 축소
#size(320, 320)으로 설정 
map1 <- get_googlemap(center = cen, maptype = "roadmap", size=c(320,320))
ggmap(map1)

#size(320, 320)으로 설정, zoom=8
#zoom값을 주지 않으면 기본적으로 10으로 되어 있음 
map1 <- get_googlemap(center = cen, maptype = "roadmap", size=c(320,320), zoom=8)
ggmap(map1)

#size(320, 320)으로 설정, zoom=13
map1 <- get_googlemap(center = cen, maptype = "roadmap", size=c(320,320), zoom=13)
ggmap(map1)

#지도의 컬러 변경
map1 <- get_googlemap(center = cen, maptype = "roadmap", color='bw')
ggmap(map1)


#extent 파라메터 설정에 의한 지도 출력
map2 <- get_googlemap(center = cen, maptype = "roadmap")
ggmap(map2)
ggmap(map2, extent='nomal')
ggmap(map2, extent="device")

# 지도에 마커 출력하기 
map3 <- get_googlemap(center = cen, maptype = "roadmap", marker=gc)
ggmap(map3)

#여러 개의 마커 출력하기
names <- c("북한산국립공원", "설악산국립공원", "오대산국립공원", "치악산국립공원", "태백산국립공원")
gc <- geocode(enc2utf8(names))
df <- data.frame(name = names, lon = gc$lon, lat = gc$lat)
cen2 <-c(mean(df$lon), mean(df$lat)) 
map <- get_googlemap(center=cen2,
                     maptype = 'roadmap',
                     zoom=8,
                     marker=gc)
gmap <- ggmap(map)
#마커에 명칭 출력
# '+' 기호를 이용하여 geom_text()함수를 추가  
gmap + geom_text(data = df,
                 aes(x=lon, y=lat),
                 size=3,
                 label=df$name)