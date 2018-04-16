rtnc=read.csv("rtn2013-2014.csv",sep=",",header=TRUE);
num<-length(rtnc[1,]);
relativeness<-matrix(nrow =num, ncol = num);
for(i in 1:(num-1)){
  for(j in (i+1):num){
    relativeness[i,j]<-cor(rtnc[,i],rtnc[,j]);
    relativeness[i,j]<-1/sqrt(2*(1-relativeness[i,j]));
    relativeness[j,i]<-relativeness[i,j];
  }
}
write.table(relativeness,"distance2013-2014.csv",quote = FALSE,sep = ",",row.names = FALSE,col.names = FALSE,na="0");