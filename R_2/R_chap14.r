#Chapter 14 이미지 처리를 위한 딥러닝 -CNN

# 14-1 MNIST 데이터셋 로드 및 구조 살피기 
library(keras)
data_mnist <- dataset_mnist()
str(data_mnist)

# 14-2 데이터셋 분리 및 구조 살피기
c(c(train_imgs, train_lables), c(test_imgs, test_labels)) %<-% data_mnist
str(train_imgs)
str(train_lables)
str(test_imgs)
str(test_labels)

# 14-3 DNN에 맞는 입력으로 변경하고 double 형으로 변경하기 
train_imgs <- array_reshape(train_imgs, c(60000,28*28))
train_imgs <- train_imgs/255

test_imgs <- array_reshape(test_imgs, c(10000, 28*28))
test_imgs <- test_imgs/255

train_lables <- to_categorical(train_lables)
test_labels <- to_categorical(test_labels)

# 14-4 모델정의하기
model <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = 'relu', input_shape = c(28*28)) %>%
  layer_dense(units = 10, activation = 'softmax')

summary(model)

# 14-4 환경설정 및 컴파일하기
model %>% compile(
  optimizer = 'adam',
  loss = 'categorical_crossentropy',
  metrics = c('accuracy')
)

# 14-5 모델 훈련
history <- model %>% fit(
  train_imgs,
  train_lables,
  epochs = 5,
  batch_size = 128,
)

# 14-5 모델의 평가
res <- model %>% evaluate(test_imgs, test_labels, verbose = 0)
res

# 전체 코드 (14-5 모델의 평가 이어서)

d_model <- keras_model_sequential() %>%
  layer_dense(units = 512, activation = 'relu', input_shape = c(28*28)) %>%
  layer_dropout(rate=0.2) %>%
  layer_dense(units = 10, activation = 'softmax')

d_model %>% compile(
  optimizer = 'adam',
  loss = 'categorical_crossentropy',
  metrics = c('accuracy')
)

d_model %>% fit(
  train_imgs,
  train_lables,
  epochs = 5,
  batch_size = 128,
)

res <- d_model %>% evaluate(test_imgs, test_labels, verbose = 0)
res

# 합성곱 신경망 모델 구현 
library(keras)

model <- keras_model_sequential() %>%
  layer_conv_2d(filters=32, kernel_size = c(3,3),activation="relu",
                input_shape=c(28,28,1)) %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_conv_2d(filters=64, kernel_size = c(3,3),activation="relu") %>%
  layer_max_pooling_2d(pool_size = c(2,2)) %>%
  layer_flatten() %>%
  layer_dropout((rate=0.5)) %>%
  layer_dense(units=128,activation = "relu")%>%
  layer_dense(units=10,activation = "softmax")

summary(model)

# 14-6 MNIST 이미지를 이용한 합성곱 신경망 훈련
data_mnist <- dataset_mnist()
# %<-% 연산자를 이용해 리스트의 값을 변수에 저장
c(c(train_imgs,train_labels),c(test_imgs,test_labels)) %<-% data_mnist

#이미지를 신경망 입력형식으로 변환 및 정규화
train_imgs <- array_reshape(train_imgs,c(60000,28,28,1))
train_imgs <- train_imgs/255
test_imgs <- array_reshape(test_imgs,c(10000,28,28,1))
test_imgs <- test_imgs/255

train_labels <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)

#모델 컴파일
model %>% compile(
  optimizer = "adam",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

#모델 훈련
history <- model %>% fit(
  train_imgs,
  train_labels,
  epochs = 5,
  batch_size = 100
)

#14-7 테스트셋을 이용한 모델 평가
res <- model %>% evaluate(test_imgs, test_labels)
res

plot(history)

