# Pergunta 5

# 1/lambda = 1/0.14
# X ~ Exp(lambda = 0.14)
# n = 637
# > 8

set.seed(1247)

x <- ecdf(rexp(637, 0.14))

1 - x(8) # P(X > 8) = 1 - P(X <= 8)

abs(x(8) - pexp(8, 0.14))