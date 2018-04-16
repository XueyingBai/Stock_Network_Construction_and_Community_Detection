function picked_sorted=pick_sort(picked_cliques,k)
%picked_sorted=[zeros(length(picked_cliques),k),picked_cliques(:,k+1)];
picked_sorted=zeros(length(picked_cliques(:,1)),k);
row=size(picked_cliques);
for i=1:row(1)
picked_sorted(i,1:k)=sort(picked_cliques(i,1:k),'ascend');
end
picked_sorted=sortrows(picked_sorted,1);
end