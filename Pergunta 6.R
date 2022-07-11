# Pergunta 6

# n = 4, 28, 71
# seed = 426
# gerar 740 amostras de população
# distribuição uniforme contínua no intervalo [14, 18]

# 1 - calcular a média de cada amostra, obtendo valoes da distribuição da média Xn
# 2 - fazer histograma de frequencia relativa associado aos valores obtidos da 
# distribuição da média Xn. Sobreponha no gráfico uma curva com a distribuição
# normal com valor esperado E(X) e variancia Var(X)/n

library(ggplot2)

E = (14 + 18) / 2
V = (18 - 14)^2 / 12
n <- c(4, 28, 71)

for(j in 1:3){
  set.seed(426)
  x = c()
  for (i in 1:740){
    x[i] <- mean(runif(n[j], min = 14, max = 18))
  }
  xdf <- data.frame(x)
  print(ggplot(xdf, aes(x = x)) + geom_histogram(aes(y = ..density..), fill = "lavender", color = "black", bins = 14) + 
          labs(title = paste("Histograma de densidades para n = ", n[j]), x = "Médias", y = "Densidade") + 
          stat_function(fun = dnorm, color = "black", args = list(mean = E, sd = sqrt(V/n[j]))))
}
