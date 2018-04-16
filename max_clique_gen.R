 #Find maximal-clique#
maximal.cliques(ig, min=3, max=NULL, subset=NULL, file="MaxClique2.csv");
Maxc<-read.csv("MaxClique2.csv",header=FALSE,stringsAsFactors = FALSE);
nummax<-maximal.cliques.count(ig, min=3, max=NULL, subset=NULL);
#k=4#
kvalue<-4;
numrow<-length(Maxc[,1])*choose(23,kvalue);
cliquem<-matrix(nrow=numrow,ncol=kvalue);#create a matrix to store k-cliques
countm<-1;
for(k in 1:nummax){
  subl<-strsplit(Maxc[k,],split=" ");
  subv<-as.numeric(unlist(subl))+1;
  if(length(subv)>=kvalue){
    #subg<-induced.subgraph(ig, subv, impl="create_from_scratch");
    #List all the cliques
    dat<-combn(subv,kvalue);
    for(i in 1:length(dat[1,])){
      #  weight<-1;
      #  dati<-unlist(dat[i]);
      dati<-dat[,i];
      for(j in 1:kvalue){
        cliquem[countm,j]<-dat[j,i];
        #   cliquem[countm,j]<-V(ig)[dat[j,i]]$name;
      }
      countm<-countm+1;
    }
  }
}
#output the result
write.table(cliquem,file="k-Clique2.txt",quote=FALSE,na = "",row.names = FALSE,col.names = FALSE)
#write.table(netm,file="Netm.txt",quote=FALSE,na = "",row.names = FALSE,col.names = FALSE);
#write.graph(ig, file="Edgelist.txt", format="edgelist",weighted=TRUE);
