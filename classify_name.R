classify<-read.csv('ClassificationFinancial2.txt',header=FALSE,stringsAsFactors = FALSE);
for(i in 1:length(classify[,1])){
  sub<-strsplit(classify[i,],split=" ");
  sub<-as.numeric(unlist(sub));
  sub<-list[sub,2];
  b<-as.vector(sub);
  c<-b[1];
  for(j in 2:length(b)){
    c<-paste(c,b[j],sep=" ");
  }
  classify[i,]<-c;
}
write.table(classify,file="ClassifyF4.txt",quote=FALSE,na = "",row.names = FALSE,col.names = FALSE)
#write.table(t(V(ig)[x]$type),file="o2.txt",quote=FALSE,na = "",row.names = FALSE,col.names = FALSE);
