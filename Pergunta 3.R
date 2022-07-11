# Pergunta 3

library(ggplot2)
library(readxl)

QualidadeARO3 <- read_excel("QualidadeARO3.xlsx", 
                            sheet = "Sheet1", range = "B1:C8785", 
                            col_types = c("numeric", "numeric"))

QEn <- QualidadeARO3[1]
QEs <- QualidadeARO3[2]

QEn$Cidade <- "Entrecampos"
colnames(QEn)[1] <- "Qualidade"
QEs$Cidade <- "Estarreja"
colnames(QEs)[1] <- "Qualidade"

total <- rbind(QEs, QEn)

ggplot(total, aes(x = Qualidade, fill = Cidade)) + geom_histogram(alpha = 0.5, position = 'identity', bins = 30) + labs(title = "Valores de ozono nas estações de Entrecampos e Estarrej em 2020", x = "Níveis de ozono (microgramas por metro cúbico)", y = "Quantidade de observações")
