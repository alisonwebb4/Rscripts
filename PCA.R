## Principal Component Analysis - R script ## 

## Load the goods
library(mvtnorm)

## Fake Data EXAMPLE - Uses artificial covariances applied 
## to randomly generated data set (derived from a normal distribution)
set.seed(123)
## Create covariance matrix (unnecessary with real data)
covariance <- matrix(c(5,3,0,-3,0, 3,5,0,-3,0, 0,0,5,0,0,
                       -3,-3,0,6,0, 0,0,0,0,3), nrow=5)
## Generate data exhibiting desired covariances
data <- rmvnorm(1000, sigma=covariance)
## Column naming
names(data) <- c("a", "b", "c", "d", "e")
## Conduct PCA and create PCA object
pca <- prcomp(data)
## See analysis output
pca
## Summary is better at this
## Greater SD / Proportion of Variance = more important PC
summary(pca)
## Choose number of PC's to use based on Proportion of Variance (Want to minimally include
## PC's that explain the most variation)
## Scree plots are the common way to determine number of PCs to use
## find where there’s an inflection point in the standard deviations: 
## you find the axes that you can join in a single straight line, and work with those axes
## plus the next one along
plot(pca)
## Biplot on PCA object to determine which variables 
## are correlated and how so (also is indicative of how many principal components to use)
biplot(pca)
## Choices arguments permits representation of any PC you want to graph
biplot(pca, choices=2:3)

## Real Data EXAMPLE - Uses variables SVL, OXY, BLCORT, BLBKA
## Load variable data
test <- read.table('covariates.txt',header=F)
## Conduct PCA 
pca <- prcomp(test, scale=T)
summary(pca)
plot(pca)
biplot(pca)

 