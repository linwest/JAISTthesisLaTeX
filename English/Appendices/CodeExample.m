function result = H2(d)
    if d==0 || d==1
        result=0;
    else
        result=-d*log2(d)-(1-d)*log2(1-d);
    end
end

function mid = H2_inv(r)
    accuracy=1e-9;
    if r<=0
        mid=0;
        
        return;
    end
    min=0;
    max=0.5;
    mid=0.25;
    while max-min>accuracy
        tmp=H2(mid);
        if abs(tmp-r)<accuracy
            break;
        end
        if tmp>r
            max=mid;
        else
            min=mid;
        end
        mid=(max+min)/2;
    end
    mid;
end

function h=joint_entropy(P)
    h=0;
    n=numel(P);
    P_=ones(1,n)-P;
    if n==0
        h=0;
    elseif n==1
        h=1;
    else
        for i=1:2^n
            A=bitget(i,1:n);
            j=A==1;
            k=A==0;
            Pj=P(j);
            Pk=P(k);
            Pj_=P_(j);
            Pk_=P_(k);
            q=0.5*(prod(Pj)*prod(Pk_)+prod(Pj_)*prod(Pk));
            h=h-q*log2(q);            
        end
    end
end