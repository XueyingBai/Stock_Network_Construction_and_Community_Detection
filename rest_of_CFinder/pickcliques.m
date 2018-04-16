function picked_cliques=pickcliques(w_cliques,threshold,k)
%pick weighted cliques to form new unweighted new graph
%w_cliques=pick_sort(w_cliques,k);
picked_cliques=zeros(length(w_cliques),k+1);
count=1;
for i=1:length(w_cliques)
    if w_cliques(i,k+1)>threshold
        picked_cliques(count,:)=w_cliques(i,:);
        count=count+1;
    else
    end
end
picked_cliques(count:end,:)=[];
%
end