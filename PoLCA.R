library("poLCA") # To use poLCA function
library("tidyLPA")
library("label.switching") # To address label switching
library("runjags") # To use JAGS via R
library("rjags")
library("glue") # To insert R code within strings
library("gt") # For pretty tables
library("knitr") # To use the "kable" function
library("kableExtra") # For more about kable
library("cowplot") # For pretty plots
library("scatterplot3d") # For 3-D plot
library("ggpubr") # To use the "ggarrange" function
library("coda") # To use Geweke’s diagnostic test
library("MASS") # To use the "mvrnorm" function
library("tidyverse") # For everything else...
dat$V1=as.factor(dat$V1)
dat$V2=as.factor(dat$V2)
dat$V3=as.factor(dat$V3)
dat$V4=as.factor(dat$V4)
dat$V5=as.factor(dat$V5)
dat$V6=as.factor(dat$V6)
dat$V7=as.factor(dat$V7)
dat$V8=as.factor(dat$V8)
dat$V9=as.factor(dat$V9)
dat$V10=as.factor(dat$V10)
dat$V11=as.factor(dat$V11)
dat$V12=as.factor(dat$V12)
dat$V13=as.factor(dat$V13)
dat$V14=as.factor(dat$V14)
dat$V15=as.factor(dat$V15)
dat$V16=as.factor(dat$V16)
dat$V17=as.factor(dat$V17)
dat$V18=as.factor(dat$V18)
dat$V19=as.factor(dat$V19)
dat$V20=as.factor(dat$V20)
dat$V21=as.factor(dat$V21)
dat$V22=as.factor(dat$V22)
dat$V23=as.factor(dat$V23)
dat$V24=as.factor(dat$V24)
dat$V25=as.factor(dat$V25)
                     
f <- cbind(V1, V2, V3, V4, V5, V6, V7, V8, V9, V10, V11, V12, V13,V14,V15,V16,V17,V18,V19,V20,V21,V22,V23,V24,V25)~1
machine_tolerance<-sqrt(.Machine$double.eps)
entropy <- function(p) {
  p <- p[p > machine_tolerance] # since Lim_{p->0} p log(p) = 0
  sum(-p * log(p))
}
lca_re <- function(x) {
error_prior <- entropy(x$P)
error_post <- mean(apply(x$posterior, 1, entropy))
re <- (error_prior - error_post) / error_prior
re
}
##LMRT Test
fit <- poLCA(formula=f, data=dat, nclass=2, maxiter=10000,
             tol=1e-5, nrep=20, verbose=F, calc.se=T)
n <- fit$Nobs #number of observations (should be equal in both models)
null_ll <- fit$llik #log-likelihood
null_param <- fit$npar # number of parameters
null_classes <- length(fit$P) # number of classes

# Fit LCA with 3 classes (ALTERNATIVE model)
fits <- poLCA(formula=f, data=dat, nclass=3, maxiter=10000,
             tol=1e-5, nrep=20, verbose=F, calc.se=T)
# Store values alternative model
alt_ll <- fits$llik #log-likelihood
alt_param <- fits$npar # number of parameters
alt_classes <- length(fits$P) # number of classes

# use calc_lrt from tidyLPA package
calc_lrt(n, null_ll, null_param, null_classes, alt_ll, alt_param, alt_classes)

# Class enumeration from K=1 to K=6
out_lca <- list() # container of model fittings
npar <- ll<- aic <- bic <- abic <- caic <- awe <- re <- c() # containers
# of other information
set.seed(123)
for(k in 1:8){
  fit <- poLCA(formula=f, data=dat, nclass=k, maxiter=10000,
               tol=1e-5, nrep=20, verbose=F, calc.se=T)
  out_lca[[k]] <- fit
  npar[k] <- fit$npar
  ll[k] <- fit$llik
  aic[k] <- fit$aic
  bic[k] <- fit$bic
  abic[k] <- -2*(fit$llik) + fit$npar*log((fit$Nobs+2)/24)
  caic[k] <- -2*(fit$llik) + fit$npar*(log(fit$Nobs)+1)
  awe[k] <- -2*(fit$llik) + 2*(fit$npar)*(log(fit$Nobs)+1.5)
  re[k] <- lca_re(fit)
   }

class <- paste0("Class-", 1:8)
# Store information in a data frame
poLCA.tab <- data.frame("Class"=class, "Npar"=npar, "LL"=ll,
                        "AIC"=aic,"BIC"=bic, "aBIC"=abic, "CAIC"=caic, "AWE"=awe, "RE"=re)

fit$predclass
######Plot


Bilgi_Kriterleri<-c(101869.2,
                    101616.1,
                    101402.4,
                    101278.1,
                    101190.4,
                    102176.8,
                    102080.7,
                    102024.0,
                    102056.8,
                    102126.1,
                    102027.4,
                    101855.1,
                    101722.1,
                    101678.6,
                    101671.7,
                    102223.8,
                    102151.7,
                    102119.0,
                    102175.8,
                    102269.1,
                    102719.3,
                    102900.3,
                    103120.6,
                    103430.4,
                    103776.8
                    
                    
                    
)

Grup<-c("AIC",
        "AIC",
        "AIC",
        "AIC",
        "AIC",
        "BIC",
        "BIC",
        "BIC",
        "BIC",
        "BIC",
        "SSABIC",
        "SSABIC",
        "SSABIC",
        "SSABIC",
        "SSABIC",
        "CAIC",
        "CAIC",
        "CAIC",
        "CAIC",
        "CAIC",
        "AWE",
        "AWE",
        "AWE",
        "AWE",
        "AWE"
)

Sinif_sayisi<-c(2, 
                3 ,
                4  ,
                5  ,
                6  ,
                2  ,
                3  ,
                4  ,
                5  ,
                6  ,
                2  ,
                3  ,
                4  ,
                5  ,
                6  , 
                2  ,
                3  ,
                4  ,
                5  ,
                6  ,
                2  ,
                3  ,
                4  ,
                5  ,
                6  
)

CR<-cbind(Sinif_sayisi,Bilgi_Kriterleri,Grup)
cr<-as.data.frame(CR)

plot<-ggplot(cr, aes(x=Sinif_sayisi, y=Bilgi_Kriterleri, group = Grup, shape=Grup, linetype=Grup,color=Grup))+ 
  geom_line() +
  geom_point()+
  labs(title="Bilgi Kriterlerinin Karşılaştırılması",x="Sınıf Sayısı", y = "Bilgi Kriteri Değerleri")+
  theme(plot.title = element_text(color = "black", size = 12, face = "bold"))


#rjags
lca_bin <- "
model{
#===========================
# likelihood specification
#===========================
for(i in 1:N) {
Z[i] ~ dcat(w[1:K]) # class membership for the i-th subject
for(j in 1:J) {
Y[i,j] ~ dbern(pi[j,Z[i]]) # Bernoulli density function
}
}
#===========================
# prior specification
#===========================
# --------- w ---------
w[1:K] ~ ddirch(alpha[1:K]) # Dirichlet prior for
# mixing proportions
for(k in 1:K) {alpha[k] <- 1}
# --------- pi ---------
for(k in 1:K) {
for(j in 1:J) {
pi[j,k] ~ dbeta(1,1) # beta prior for conditional
# probabilities
}
}
}"

lca_multi <- "
model{
#===========================
# likelihood specification
#===========================
for(i in 1:N) {
Z[i] ~ dcat(w[1:K]) # Class membership for the i-th subject
for(l in 1:L) {
Y[i,l] ~ dcat(pi[Z[i],l,1:C[l]]) # normal density
}
}
#===========================
# prior specification
#===========================
# --------- w ---------
w[1:K] ~ ddirch(alpha[1:K]) # Dirichlet prior for
#mixing proportions
for(k in 1:K) {alpha[k] <- 1}
# --------- pi---------
for(k in 1:K) {
for(l in 1:L) {
pi[k,l,1:C[l]] ~ ddirch(beta[1:C[1:C]]) # normal prior for mean
}
}
}"

lca_count <- "
model{
#===========================
# likelihood specification
#===========================
for(i in 1:N) {
Z[i] ~ dcat(w[1:K]) # Class membership for the i-th subject
for(j in 1:J) {
Y[i,j] ~ dbern(pi[j,Z[i]]) # Bernoulli density function
}
for(l in 1:L) {
X[i,l] ~ dnorm(mu[l,Z[i]], tau[l,Z[i]]) # normal density
}
}
#===========================
# prior specification
#===========================
# --------- w ---------
w[1:K] ~ ddirch(alpha[1:K]) # Dirichlet prior for
#mixing proportions
for(k in 1:K) {alpha[k] <- 1}
# --------- pi ---------
for(k in 1:K) {
for(j in 1:J) {
pi[j,k] ~ dbeta(3,3) # beta prior for IRPs
}
}
# --------- mu & tau ---------
for(k in 1:K) {
for(l in 1:L) {
mu[l,k] ~ dnorm(0,1.0E-6) # normal prior for mean
tau[l,k] ~ dgamma(0.01,0.01) # gamma prior for precision
}
}
}"


lca_multi2 <- "
model{
#===========================
# likelihood specification
#===========================
for(i in 1:N) {
Z[i] ~ dcat(w[1:K]) # Class membership for the i-th subject
for(j in 1:J) {
Y[i,j] ~ dcat(pi[Z[i],j,1:C[j]]) # categorical density function
}
}
#===========================
# prior specification
#===========================
# --------- w ---------
w[1:K] ~ ddirch(alpha[1:K]) # Dirichlet prior for hyperparameters
#---------alpha---------
for(k in 1:K) {alpha[k] <- 1}
# --------- pi---------
for(k in 1:K) {
for(j in 1:J) {
pi[k,j,1:C[j]] ~ ddirch(beta[1:C[j]]) #drichlet- beta hyperparameters prior for conditional probabilities
}
}
}
"
Dat <- list("Y" = as.matrix(dat), "N" = N, "J" = J, "K" = K, "C" = C, "beta" = rep(1, max(C)))


Dat <- list("Y"=as.matrix(dat), "N"=5132, "J"=23, "K"=4)
inits <- list(".RNG.name"="base::Wichmann-Hill", ".RNG.seed"=111)
out_bin <- run.jags(model=lca_bin, monitor=c('w','pi'),
                    data=Dat, inits=inits, method="rjags",
                    n.chains=1, adapt=1000, burnin=1000,
                    sample=10000, thin=1)


