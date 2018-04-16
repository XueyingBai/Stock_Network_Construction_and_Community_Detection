function community = formcom(linked_cliques)
community=cell(0);
count=1;
%alcom=[0];%cliques already been unioned
alcom=[];
size=length(alcom);
num=length(linked_cliques);
while size~=num
for i=1:num
    if isempty(find(alcom==i))%not unioned
        community{count}=onecommunity(linked_cliques,i);
        alcom=[alcom;community{count}];
        size=length(alcom);
        count=count+1;
        break;
    end
end
end
end