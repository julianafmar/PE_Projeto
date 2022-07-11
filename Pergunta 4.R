# Pergunta 4

library(readxl)
Utentes <- read_excel("Utentes.xlsx")

plot(Utentes$TAD, Utentes$Colesterol, main="Utentes",
     xlab="TAD", ylab="Colesterol", pch=19)
lines(lowess(Utentes$TAD, Utentes$Colesterol), col = "blue")