# Pergunta 7
# Fixar semente em 996, gerar 6100 amostras de dimens�o 147 de uma popula��o, 
# X, com distribui��o binomial(45, 0.99)

set.seed(996)

vec = c()
for (i in 1:6100){
  vec[i] <- mean(rbinom(147, 45, 0.99))
}

abs(mean(vec) -  45 * 0.99)