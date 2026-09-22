t <- 1:20
N <- numeric(20)
N[1] <- 30

I <- numeric(20)
S <- numeric(20)

S[1] <- N[1]
r <- numeric(20)
R <- numeric(20)

prob <- 0.05

for(i in 2:20){
      
      n <- N[i - 1] + (S[i-1] + R[i-1]) * runif(1, -0.1, 0.12) * (1 - N[i-1])/rpois(1, 60)
      N[i] <- rpois(1, lambda = n) + I[i-1]
      
      r[i] <- rpois(1, I[i-1]*runif(1, 0.08, 0.12))
      
      if(I[i] == 0){
            I[i] <- rpois(1, N[i] * prob)
      } else {
            if(R[i-1] > I[i]){
                  I[i] <- I[i-1] + rpois(1, N[i] * (I[i]/N[i])*0.1) - rpois(1, I[i-1]*0.05)
            } else {
                  I[i] <- I[i-1] - r[i] + rpois(1, N[i-1] * (I[i-1]/N[i-1])*0.05) - rpois(1, I[i-1]*0.05)
            }
      }
      S[i] <- N[i] - I[i] - R[i]
      R[i] <- R[i-1] + r[i]
}


plot(t, N)
plot(t, I)
plot(t, S)
plot(t, r)
plot(t, R)

datos <- data.frame(Tiempo = t,
                    Susceptibles = S,
                    Infectados = I,
                    Recuperados = R)

write.csv(datos, "Materiales-practicas/Datos-epi.csv", row.names = FALSE)


