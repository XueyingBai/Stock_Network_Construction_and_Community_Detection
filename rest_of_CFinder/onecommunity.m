function commcell=onecommunity(linked_cliques,i)
%i is the location of vector to union
%For given i,find all cliques contained in the same community
%BFS
head=1;             %����ͷ
tail=1;             %����β����ʼ����Ϊ�գ�tail==head
queue(head)=i;      %��ͷ�м���ͼ��һ���ڵ�(��ʼ��i��clique)
head=head+1;        %������չ
flag=i;             %���ĳ��clique�����Ƿ���ʹ���
%commcell=linked_cliques{i};
m=length(linked_cliques);%���ж���clique����
while tail~=head    %�ж϶����Ƿ�Ϊ��
    q=queue(tail);  %ȡ��β�ڵ�
%    queue=union(queue,linked_cliques{q}(2:end)');
%    head=length(queue)+1;
    for j=1:m
        if isempty(find(linked_cliques{q}==j))==0 && isempty(find(flag==j))==1    %����ڵ���������û�з��ʹ�
            queue(head)=j;                          %�½ڵ�����
            head=head+1;                            %��չ����
            flag=[flag j];                          %���½ڵ���б��
%            commcell=union(commcell,linked_cliques{j});%�ϲ�
        end
    end
    tail=tail+1;            
end
commcell=queue';
end