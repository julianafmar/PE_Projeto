# Pergunta 2

library(ggplot2)
library(readxl)

EsperancaVida <- read_excel("EsperancaVida.xlsx", 
                            sheet = "Quadro", range = "A9:CY70")
EsperancaVida <- EsperancaVida[-(1:42),]
EsperancaVida <- EsperancaVida[-(19),]

EsperancaVida <- EsperancaVida[-c(2:44, 46:62, 65:78,80:96, 99:103)]
colnames(EsperancaVida)[1] <- "Anos"
colnames(EsperancaVida)[2:7] <- "Esperan�a de vida"

DKM <- EsperancaVida[c(1, 2)]
DKM$Pa�s <- "DK - Dinamarca M"
CZM <- EsperancaVida[c(1, 3)]
CZM$Pa�s <- "CZ - Rep�blica Checa M"
ROM <- EsperancaVida[c(1, 4)]
ROM$Pa�s <- "RO - Rom�nia M"
DKF <- EsperancaVida[c(1, 5)]
DKF$Pa�s <-"DK - Dinamarca F"
CZF <- EsperancaVida[c(1, 6)]
CZF$Pa�s <- "CZ - Rep�blica Checa F"
ROF <- EsperancaVida[c(1, 7)]
ROF$Pa�s <- "RO - Rom�nia F"

total <- rbind(DKM, CZM, ROM, DKF, CZF, ROF)

ggplot(data=total, aes(x = Anos, y = `Esperan�a de vida`, group=Pa�s, color=Pa�s)) + 
  geom_line() + labs(title = "Esperan�a de vida entre 2002 e 2019 na Rep�blica Checa, Dinamarca e Rom�nia")