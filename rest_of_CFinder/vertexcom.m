function vcom = vertexcom(community,picked_cliques,k)
vcom=cell(0);
num=length(community);
%vcomcell=[];
for i=1:num
    vcomcell=[];
    l=length(community{i});
    for j=1:l
        vcomcell=union(vcomcell,picked_cliques(community{i}(j),1:k));
    end
    vcom{i}=vcomcell;
end
fid=fopen('ClassificationFinancial.txt','w');
for i=1:max(size(vcom))
    fprintf(fid,'%d ',vcom{i});
    fprintf(fid,'\n');
end 
end