# Pergunta 10
# seed = 378
# m = 1500 amostras de dimensao n
# n E {100, 200, 300, ..., 2500}
# X ~ Exp(lambda = 4.07)

# e * 100% = 25%
# Xc ~ Exp(lambdac = 1.37)
# nivel de confiança (1 - alpha) = 0.93

library(ggplot2)
set.seed(378)

MA <- c()
MAC <- c()
n <- seq(100, 2500, by = 100)
q <- qnorm(1 - (0.07 / 2), mean = 0, sd = 1)

for(i in 1:25){
  matemp <- c()
  mactemp <- c()
  for(j in 1:1500){
    x <- c()
    x <- rexp(n[i], 4.07)
    xc <- append(sample(x, size = n[i] * 0.75), rexp(n[i] * 0.25, 1.37))
    
    lb = (mean(x) + q * sqrt(var(x)/n[i]))**-1
    ub = (mean(x) - q * sqrt(var(x)/n[i]))**-1
    matemp[j] = (ub - lb)
    
    lb = (mean(xc) + q * sqrt(var(xc)/n[i]))**-1
    ub = (mean(xc) - q * sqrt(var(xc)/n[i]))**-1
    mactemp[j] = (ub - lb)
  }
  MA[i] <- mean(matemp)
  MAC[i] <- mean(mactemp)
}

df <- data.frame(MA, MAC, n)
ggplot(data = df, aes(x = n)) + geom_point(aes(y = MA, color = "Não Contaminadas")) + geom_point(aes(y = MAC, color = "Contaminadas")) + scale_color_manual(name = "Amostras", values = c( "Não Contaminadas" = "darkorange2", "Contaminadas" = "darkcyan"), labels = c("Não Contaminadas", "Contaminadas")) + labs(x = "Dimensão da Amostra", y = "Média das Amplitudes dos Intervalos de Confiança", title = "Gráfico da média da amplitude de intervalos de confiança de amostras geradas com e sem contaminação")
