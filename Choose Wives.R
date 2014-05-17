## Optimal Stopping Problem

## Replicate for 1000 trials
x <- replicate(1000, {
        
        ## Create random variable for potential mates ranked from 0 to 10.
        ## Note: In reality the rankings would be closer to a normal 
        ## distribution. To set bounds from 0 to 10 we use 
        ## a uniform distribution.
        wives <- runif(100, min = 1, max = 10)
        
        ## Evaluate first set 1/e variables.
        best1 <- max(wives[1:36])
        
        ## Evaluate variables in next set. 
        ## Stop when one variable is better than first set variables.
        for(i in wives[37:100]){
                if(i > best1){
                        optimal <- i   
                        break
                }
        }
        
        ## Check for optimal value. If optimal value is not found, 
        ## return last choice.
        if(!exists("optimal")){
                optimal <- wives[100]
        }
        
        ## Print choice
        optimal
        
})

## Historgram
library(lattice)
median = paste("Median Spouse Rank:", formatC(median(x), digits = 3))
histogram(x, main = median, col = 'red', xlab = 'Rank on a Scale from 1 to 10')
