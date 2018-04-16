function commcell=onecommunity(linked_cliques,i)
%i is the location of vector to union
%For given i,find all cliques contained in the same community
%BFS
head=1;             %队列头
tail=1;             %队列尾，开始队列为空，tail==head
queue(head)=i;      %向头中加入图第一个节点(初始第i个clique)
head=head+1;        %队列扩展
flag=i;             %标记某个clique集合是否访问过了
%commcell=linked_cliques{i};
m=length(linked_cliques);%共有多少clique集合
while tail~=head    %判断队列是否为空
    q=queue(tail);  %取队尾节点
%    queue=union(queue,linked_cliques{q}(2:end)');
%    head=length(queue)+1;
    for j=1:m
        if isempty(find(linked_cliques{q}==j))==0 && isempty(find(flag==j))==1    %如果节点相连并且没有访问过
            queue(head)=j;                          %新节点入列
            head=head+1;                            %扩展队列
            flag=[flag j];                          %对新节点进行标记
%            commcell=union(commcell,linked_cliques{j});%合并
        end
    end
    tail=tail+1;            
end
commcell=queue';
end