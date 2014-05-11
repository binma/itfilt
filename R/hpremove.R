# remove homopolyer seqeunces
hpremove<-function(prok){
  hpp<-grep("[A]{5,}|[C]{5,}|[G]{5,}|[T]{5,}",prok)
  prokhp<-prok[-hpp]
  prokhp
}
