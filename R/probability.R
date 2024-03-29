#' Sign consistency probability and the value for r parameter 1-1 transformation
#'
#' This function transforms the probability of simulated beta_j having the same
#' sign with the underlying true effect barbeta to the corresponding heterogeneity
#' r parameter value.
#'
#' @param p A value, the required probability of sign consistency.
#'
#' @return
#' The corresponding heterogeneity parameter value.
#'
#'
prob_to_r<-function(p){

  target<-function(r){
    c<- sqrt(2/pi)
    t<-round(integrate(function(t){
      pnorm(sqrt((1-r)/r)*t) * exp(-t^2/2)
      }, 0, Inf,abs.tol = .Machine$double.eps^0.1)$value,4)
    res=c*t
    return(res-p)
  }

  root<-uniroot(target,c(0,0.1),tol = .Machine$double.eps^0.2)$root
  return(root)
}



