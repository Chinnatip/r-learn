roll_dice <- function(n){
  total <- sum( sample(1:6, n , replace= T) )
  print(total)
}
