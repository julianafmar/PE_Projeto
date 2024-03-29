# Pergunta 1

library(ggplot2)
library(readxl)

ResiduosPerCapita <- read_excel("ResiduosPerCapita.xlsx", 
                                sheet = "Quadro", range = "A10:C43")
ResiduosPerCapita <- ResiduosPerCapita[-1,]
ResiduosPerCapita <- ResiduosPerCapita[-1,]
colnames(ResiduosPerCapita)[2] <- "2004"
colnames(ResiduosPerCapita)[3] <- "2018"

newRPC <- ResiduosPerCapita[c(4, 9, 17),]
newRPC <- cbind(newRPC["Grupos/Pa�ses"], 
                stack(newRPC[c("2004", "2018")])["values"], row.names=NULL)
newRPC["Anos"] <- rep(c("2004", "2018"), each = 3)
colnames(newRPC)[2] <- "Res�duos produzidos per capita" 

ggplot(newRPC, aes(x = `Grupos/Pa�ses`, y = `Res�duos produzidos per capita`, fill = Anos)) + geom_bar(stat='identity', position='dodge') + labs(title = "Res�duos per capita em 2004 e 2018 na Eslov�nia, Irlanda e B�lgica")