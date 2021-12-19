# p.257 
# 2. 다음을 R 코드로 작성하시오.
install.packages("ggmap")
library(ggmap)
register_google(key="AIzaSyB2K5QjyQTuiWTnhRfZaRoiF2Ks7iTaNK0")
# 2-1 우리나라 전국의 지도에 서울특별시와 광역시를 표시하시오.
# 이떄 지도의 유형은 roadmap, zoom은 8로 설정하고 마커와 텍스트를 표시하시오.
# 지도에 표시할 장소를 add_city에 저장 
add_city <- c("서울특별시", "인천광역시",
              "대전광역시", "대구광역시",
              "광주광역시", "울산광역시",
              "부산광역시")
# add_city의 위도와 경도를 저장 
city <- geocode(enc2utf8(add_city))
city
# 지명이름, 경도, 위도가 포함된 데이터 프레임 생성 
df.city <- data.frame(name=add_city, lon= city$lon, lat=city$lat)
df.city
# 지도의 중심점을 계산 
cen <- c(mean(df.city$lon), mean(df.city$lat))
map_city <- get_googlemap(center = cen,
                          maptype = "roadmap",
                          zoom = 8,
                          markers = city)
ggmap(map_city)
gmap_city <- ggmap(map_city)
gmap_city + geom_text(data = df.city,
                 aes(x=lon, y=lat),
                 size=3,
                 label = df.city$name)
# 마커를 8로 설정할 경우 서울이 안보이는 문제점이 있음 

# 2-2 제주도의 관광 명소 중 다음 6개의 지점을 지도에 표시 
Tourism_name <- c("성산일출봉", "한라산",
                  "금오름", "천지연폭포",
                  "용두암", "중문관광단지")
Tourism <- geocode(enc2utf8(Tourism_name))
Tourism
df.Tourism <- data.frame(name = Tourism_name,
                         lon = Tourism$lon,
                         lat = Tourism$lat)
df.Tourism
cen_T <- c(mean(df.Tourism$lon), mean(df.Tourism$lat))
cen_T
map_T <- get_googlemap(center =  cen_T,
                       maptype = "roadmap",
                       markers = Tourism)
ggmap(map_T)
gmap_T <- ggmap(map_T)
gmap_T + geom_text(data = df.Tourism,
                   aes(x=lon, y=lat),
                   size=3,
                   label = df.Tourism$name)
