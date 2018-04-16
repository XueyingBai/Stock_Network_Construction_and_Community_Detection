function linked_cliques=clique_to_clique(picked_cliques,k)
%Generate the clique-clique overlap matrix
%In the generated matrix, those share k-1 nodes are 1,others are 0
linked_cliques = cell(0);
num=length(picked_cliques);
%ccmatrix = zeros(num);
%count=1;
for i = 1:num
    member=[i];
    for j = i+1:num
    if picked_cliques(i,k)<=picked_cliques(j,1)
        break;
    else
        member=compare2(picked_cliques(i,1:k),picked_cliques(j,1:k),k,member,j);
    end
    end
%   ccmatrix
%    linked_cliques{count}=member;
%    count=count+1;
    linked_cliques{i}=member;
end
%使用矩阵转置更好，可能空间不够
for i=2:num
    for j=1:(i-1)
        if find(linked_cliques{j}==i)
            linked_cliques{i}=[linked_cliques{i};j];
        end
    end
end
end