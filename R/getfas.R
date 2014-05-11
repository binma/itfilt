# getfas function can used for generate fasta files for each file. 
getfas<-function(filename,qualc=56,seqlen=100,seqdic=getwd(),samname=filename){
  # read file
  seq<-readFastq(paste(seqdic,filename[1],sep="/"),format="fastq")
  seqex<-sread(seq) # sequence data
  qualex<-quality(seq) # quality data

  #quality 
  source("qualmean.R")
  qualphred<-lapply(PhredQuality(qualex),as.integer)
  qualmeans<-unlist(lapply(qualphred,qualmean))
  
  #q05<-quantile(qualmeans,probs=0.05) #qualtile of 5%
  seqqual<-seqex[qualmeans>=qualc]
  
  # seq length
  seqwidth<-seqqual[width(seqqual)>seqlen]
  names(seqwidth)<-paste(samname,1:length(seqwidth),sep="_")
  seqwidth
}