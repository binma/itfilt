# set working dictory at github
setwd("C:/Users/Administrator/Documents/GitHub/itpre")

# fetch sequences file names
seqdic<-c("f:/2014/ion torrent/third batch/Fastq")
filename<-list.files(seqdic)

require(Biostrings)
require(ShortRead)
# read all sequences
source("getfas.R")
itarc<-lapply(filename,getfas)
# remove homopolyer
source("hpremove.R")
hpitarc<-lapply(itarc,hpremove)
# write sequences to files

source("wriseq.R")
lapply(hpitarc,wriseq)





