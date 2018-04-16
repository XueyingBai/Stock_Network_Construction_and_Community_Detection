#####filter degree=0################
deg=unname(degree(ig));
for(i in 1:length(list[,1])){
  V(ig)[i]$degree<-deg[i]
}
igraph.options(vertex.size=3,vertex.label=NA,edge.arrow.size=0.5);
g<-delete.vertices(ig, which(V(ig)$degree==0));
#lec<-leading.eigenvector.community(g);
lec<-cluster_walktrap(g);
#lec<-cluster_infomap(g);
for(i in 1:max(lec$membership)){
  write.table(t(V(g)[which(lec$membership==i)]$name),file=paste(i, ".txt", sep=""),quote=FALSE,na = "",row.names = FALSE,col.names = FALSE);
}
df <- get.data.frame(ig);
write.table(df,file="Edgelist2.txt",quote=FALSE,na = "",row.names = FALSE,col.names = FALSE);
modularity(lec)
