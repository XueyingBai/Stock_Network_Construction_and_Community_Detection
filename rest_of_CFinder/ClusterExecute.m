clc;clear all;
weight=load('mCluster.txt');
dat=load('k-Clique2.txt');
[w_cliques,y]=weight_clique(dat,weight,3);
picked_cliques=pickcliques(w_cliques,2.28,3);
linked_cliques=clique_to_clique(picked_cliques,3);
community = formcom(linked_cliques);
vcom = vertexcom(community,picked_cliques,3);