add2 <- function(x, y) {
    x + y
}

aboveN <- function(vector, n = 10) {
    use <- vector > n
    vector[use]
}

make.power <- function(n) {
    pow <- function(x) {
        x * n
    }
    pow
}

y <- 10

f <- function(x) {
    y <- 2
    y ^ 2 + g(x)
}

g <- function(x) {
    x * y
}