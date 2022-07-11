# Pergunta 9
# seed = 819
# m = 1400 amostras de dimensao n
# n E {100, 200, 300, ..., 5000}
# X ~ Exp(lambda = 1.7)
# nivel de confiança 1 - alpha = 0.96
# para cada n calcular a media de amplitude dos m = 1400 IC obtidos

set.seed(819)

n <- seq(100, 5000, by = 100)
MA = c()

for (i in 1:50){
  vec = c()
  for (j in 1:1400){
    x = c()
    x <- rexp(n[i], 1.7)
    lb = (1 / mean(x)) * (1 - (qnorm(1 - (0.04 / 2), mean = 0, sd = 1)) / sqrt(n[i]))
    ub = (1 / mean(x)) * (1 + (qnorm(1 - (0.04 / 2), mean = 0, sd = 1)) / sqrt(n[i]))
  
    vec[j] = (ub - lb)
  }
  MA[i] <- mean(vec)
}

MAdf <- data.frame(MA, n)

ggplot(MAdf, aes(x = n, y = MA)) + labs(title = "Médias de amplitude por dimensão da amostra") + geom_point()