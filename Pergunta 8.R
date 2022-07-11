# Pergunta 8
# X ~ Exp(lambda = 1.03)
# nivel de confiança = 1 - alpha = 0.999

set.seed(290)

m = 1200
n = 861
lambda = 1.03
alpha = 0.001

vec = c()
for (i in 1:m){
  x = c()
  x <- rexp(n, lambda)
  lambda_mle = 1 / mean(x)
  lb = lambda_mle * (1 - (qnorm(1 - (alpha / 2), mean = 0, sd = 1)) / sqrt(n))
  ub = lambda_mle * (1 + (qnorm(1 - (alpha / 2), mean = 0, sd = 1)) / sqrt(n))

  vec[i] <- (ub - lb)
}

mean(vec)
