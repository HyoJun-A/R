#chapter 13 딥러닝 
# 데이터셋 정의
# 13-1 mlbench 패키지 설치와 Sonar 데이터 로드
install.packages("mlbench")
library(mlbench)

data("Sonar", package = "mlbench")

str(Sonar)

# 13-2 훈련데이터와 검증데이터 정의
ind <- c(1:50, 81:130, 151:200)

# 13-3 모델 정의 
model <- keras_model_sequential() %>%
  layer_dense(units = 24, activation = 'relu', input_shape = c(60)) %>%
  layer_dense(units = 10, activation = 'relu') %>%
  layer_dense(units = 1, activation = 'sigmoid')

install.packages("keras")
library(keras)

# 13-4 컴파일 및 환경 설정 
# 모델 컴파일
model %>% compile(
  optimizer = 'adam',
  loss = 'binary_crossentropy',
  metrics = c("accuracy")
)

# 13-5 모델 내용 확인
summary(model)

# 13-6 모델 훈련
history <- model %>% fit(
  train.x,
  train.y,
  epochs = 200,
  batch_size = 10,
  validation_data = list(test.x, test.y),
  loss = "binary_crossentropy",
  metrics = c("accuracy")
)
