library("quantmod");
Stocklist<-read.csv("Stocklist.csv",stringsAsFactors = FALSE,header=TRUE);
stockname<-Stocklist[,1];
CSI300<-new.env();
attr(CSI300,"name")<-"CSI300";
rtn<-matrix(nrow =520, ncol = 300);
#drop missing index#
ind<-1:length(stockname)
ind<-ind[-c(4,8,11,15,20,26,29,60,61,63,152,156,160,166,180,185,190,201,227,232,247,248,253)]
for(i in ind){  
  a<-stockname[i];
  rtn[1,i]<-a;
  setSymbolLookup(b=list(name=a, src="yahoo",env=CSI300,from="2013-1-1",to="2014-12-31"));
  getSymbols("b");
  ################################get the distance matrix########################################
  x<-coredata(B);
  na.fill(x,0);
  d<-length(x[,1]);
  if(d==520){
    rtn[2:520,i]<-diff(log(x[,4]));
  }
}
write.table(rtn,"rtn2013-2014.csv",quote = FALSE,sep = ",",row.names = FALSE,col.names = FALSE);
