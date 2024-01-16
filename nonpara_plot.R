n = 300
set.seed(1)
x <- sort(runif(n) * 2 * pi)
y <- sin(x) + rnorm(n) / 4
dfm <- data.frame(time = 1:n, y = y)

new_line <- data.frame(matrix(nrow = 0, ncol = 2))
colnames(new_line) <- c("time", "y")

window = 30
for (i in 1:(n - window)) {
  flush.console()
  new <- data.frame(time = dfm$time[i:(i + window)],
                    y = dfm$y[i:(i + window)])
  new_line[i, ] <- c((i+(window/2-1)), mean(new$y)) 
  plot(dfm$time, dfm$y)
  abline(v=i, col = "green")
  abline(v=(i+window), col = "green")
  lines(new$time, rep(mean(new$y), (window+1)),
        lwd = 4,
        col = "blue")
  lines(new_line$time, new_line$y,
        type = "l",
        col = "red",
        lwd = 3)
  Sys.sleep(.09)
}

