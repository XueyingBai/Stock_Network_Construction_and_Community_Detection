function member=compare2(picked1,picked2,k,member,j)
%if picked1(k)<=picked2(1)
%else%Compare the first element
if k>0
%if k>1
    if picked1(1)~=picked2(1)%if not same, the rest is same or cuowei
        if picked1(k)<picked2(k)
            sub=picked2(1:k-1)-picked1(2:k);
            if sub==zeros(1,k-1)
                member=[member;j];
            end
        else
            if picked1(k)>picked2(k)
            else
               sub=picked2(2:k)-picked1(2:k);
               if sub==zeros(1,k-1)
                  member=[member;j];
               else
                  member=compare2(picked1(1,1:(k-1)),picked2(1,1:(k-1)),k-1,member,j);
               end
            end
        end
    else%if same,compare the last element
          if k==2
              member=[member;j];
          else
          newcal=[picked1(2:k);picked2(2:k)];
          newcal=pick_sort(newcal,(k-1));
          member=compare2(newcal(1,1:(k-1)),newcal(2,1:(k-1)),k-1,member,j);
          end
    end
end
end