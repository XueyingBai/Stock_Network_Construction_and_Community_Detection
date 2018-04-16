function [w_cliques,y]=weight_clique(dat,weight,k)
%Calculate weights of cliques
%dat:list of detected k_cliques
%weight£ºmatrix of weighted edges
%k:size of the clique
%First multiply all the internal weighted edges
dat=pick_sort(dat,k);
dat=unique(dat,'rows');
w_cliques=[dat,zeros(length(dat),1)];
w_vector=zeros(length(dat),1);
%combine=zeros(nchoosek(k,2),k);%all edges contained in the clique
for i=1:length(dat)
    weightall=1;
    combine=combntns(dat(i,:),2);%list all edges contained in the clique
    for j=1:length(combine)
        weightall=weightall*weight(combine(j,1),combine(j,2));
    end
    weightall=weightall^(2/(k*(k-1)));
    w_vector(i)=weightall;
    w_cliques(i,k+1)=weightall;
end
x=1:length(dat);
y=sort(w_vector,'descend');
plot(x,y);%Try to find the threshold
end
    
    
    
