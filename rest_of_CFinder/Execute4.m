%k=4
clc;clear all;
weight=load('distance2013-2014.txt');
dat=load('k-Clique2.txt');
[w_cliques,y]=weight_clique(dat,weight,4);
picked_cliques=pickcliques(w_cliques,1.2,4);
linked_cliques=clique_to_clique(picked_cliques,4);
community = formcom(linked_cliques);
vcom = vertexcom(community,picked_cliques,4);