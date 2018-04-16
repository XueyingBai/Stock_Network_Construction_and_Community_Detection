library(igraph);
#Create a graph#
net<-read.table("distance2013-2014.txt",sep=",",header=FALSE);
netm<-as.matrix(net);
ig <- graph.adjacency(netm, mode="undirected", weighted=TRUE);
ig<-simplify(ig);
low<-min(E(ig)$weight);
high<-max(E(ig)$weight);
i<-low;
n<-c();
size<-c();
while(i<=high){
  n<-c(n,i);
  i=i+0.001;
}
num<-length(n);
##########threshold for percolation################
for(i in 1:num){
  ig<-delete.edges(ig,which(E(ig)$weight<n[i]));
  size<-c(size,max(clusters(ig)$csize));
}
theta<-n;
dev.new()
plot(theta,size);
threshold<-1.0;
ig <- graph.adjacency(netm, mode="undirected", weighted=TRUE);
ig<-simplify(ig);
ig<-delete.edges(ig,which(E(ig)$weight<threshold));
###########color and other attributes###############
list<-read.csv("Stocklist.csv",header=TRUE);
for(i in 1:length(list[,1])){
  V(ig)[i]$id<-i;
  V(ig)[i]$name<-as.vector(list[i,2]);
  V(ig)[i]$type<-as.vector(list[i,4]);
}
#Set the color for each team#
color<-list[,5];
colorm<-t(as.matrix(color));
colors<-rainbow(10);
for(i in 1:length(colorm[1,])){
  V(ig)[i]$color<-colors[colorm[i]];
}
ig<-simplify(ig);
igraph.options(vertex.size=3, vertex.label=NA,edge.arrow.size=0.5);
dev.new()
plot(ig,layout = layout.fruchterman.reingold);
###################betweenness and evan################################
V(ig)$bte = betweenness(ig, directed = F);
dev.new()
plot(V(ig)$bte);
V(ig)$evc = unlist(evcent(ig,directed=F)$vector);
dev.new()
plot(1:292,V(ig)$evc,xlab="",ylab="evcent");
dev.new()
plot(V(ig)$evc,V(ig)$bte,xlab="evcent",ylab="betweenness");
print(V(ig)[bte>=750&evc>0.6]$name)
###################degree distribution################################
dev.new()
plot(degree_distribution(ig),type='l',xlab="index",ylab="Degree_distribution")
dev.new()
plot(log(1:length(degree_distribution(ig))),log(degree_distribution(ig)),xlab="log(degree)",ylab="log(degree_distribution)")

