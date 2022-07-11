# Pergunta 2

library(ggplot2)
library(readxl)

EsperancaVida <- read_excel("EsperancaVida.xlsx", 
                            sheet = "Quadro", range = "A9:CY70")
EsperancaVida <- EsperancaVida[-(1:42),]
EsperancaVida <- EsperancaVida[-(19),]

EsperancaVida <- EsperancaVida[-c(2:44, 46:62, 65:78,80:96, 99:103)]
colnames(EsperancaVida)[1] <- "Anos"
colnames(EsperancaVida)[2:7] <- "Esperança de vida"

DKM <- EsperancaVida[c(1, 2)]
DKM$País <- "DK - Dinamarca M"
CZM <- EsperancaVida[c(1, 3)]
CZM$País <- "CZ - República Checa M"
ROM <- EsperancaVida[c(1, 4)]
ROM$País <- "RO - Roménia M"
DKF <- EsperancaVida[c(1, 5)]
DKF$País <-"DK - Dinamarca F"
CZF <- EsperancaVida[c(1, 6)]
CZF$País <- "CZ - República Checa F"
ROF <- EsperancaVida[c(1, 7)]
ROF$País <- "RO - Roménia F"

total <- rbind(DKM, CZM, ROM, DKF, CZF, ROF)

ggplot(data=total, aes(x = Anos, y = `Esperança de vida`, group=País, color=País)) + 
  geom_line() + labs(title = "Esperança de vida entre 2002 e 2019 na República Checa, Dinamarca e Roménia")