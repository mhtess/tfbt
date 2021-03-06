# clears workspace:  
rm(list=ls()) 

# sets working directories:
setwd("C:/Users/EJ/Dropbox/EJ/temp/BayesBook/test/ParameterEstimation/LatentMixtures")
library(R2jags)

k <- c(21,17,21,18,22,31,31,34,34,35,35,36,39,36,35)
p <- length(k) #number of people
n <- 40 # number of questions


data <- list("p", "k", "n") # to be passed on to JAGS
myinits <-	list(
  list(phi = 0.75, z = round(runif(p)))) # Initial group assignment

# parameters to be monitored:	
parameters <- c("phi","z")

# The following command calls JAGS with specific options.
# For a detailed description see the R2jags documentation.
samples <- jags(data, inits=myinits, parameters,
	 			 model.file ="Exams_1J.txt", n.chains=1, n.iter=1000, 
         n.burnin=1, n.thin=1, DIC=T)
# Now the values for the monitored parameters are in the "samples" object, 
# ready for inspection.

plot(samples)