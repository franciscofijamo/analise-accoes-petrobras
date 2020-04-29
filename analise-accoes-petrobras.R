#Analise financeira
#http://www.quantod.com

install.packages("quantmod")
install.packages("xts")
install.packages("moments")

library(quantmod)
library(xts)
library(moments)


#Selecao de periodo de analise
startDate = as.Date("2019-04-29")
endDate = as.Date("2020-04-29")

#download de dados
?getSymbols
getSymbols("PETR4.SA", src = "yahoo", from = startDate, to = endDate)

#Observando o tipo de dado retornado
class(PETR4.SA)

head(PETR4.SA)
View(PETR4.SA)

#Analisando dados de fechamento
#fatiando data.frame
PETR4.SA.Close <- PETR4.SA [,"PETR4.SA.Close"]
is.xts(PETR4.SA.Close)

#usando Cl para fatiar serie temporal
?Cl
head(Cl(PETR4.SA),5)

#Analise da Petrobras com Grafico de candlestick 
?candleChart
candleChart(PETR4.SA)


#Plot de fechamento de accoes
#
plot(PETR4.SA.Close, main = "Fechamento Diario de Accoes Petrobras",
     col = "red", xlab = "Dasta", ylab = "Preco", major.ticks ='months',
     minor.ticks = FALSE)


#adicionando as bandas de bollinger ao grafico. com media de 20
#Bollinger Band (Desvio padrao) ajustam-se as condicoes de mercado.

?addBBands
#n - media, sd - Desvio padrao
addBBands(n=20,sd=2)


#adicionando o indicador ADX, media 11 do tipo exponencial
?addADX
addADX(n = 11, maType = "EMA")