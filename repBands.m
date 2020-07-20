function [ selectedBand ] = repBands(K, bandSubspace,S,mVar)

for i = 1:length(bandSubspace) - 1
    if(i == 1)
        z = 0;
    else
        z = 1;
    end
    L(bandSubspace(i) + z:bandSubspace(i+1)) = i;
end

Number = 2; % hyperparameter
for i = 1:K-1
        [v_x, ~]=find(L' == i);
        
        if(size(v_x,1) > Number)
        subS = S(v_x,v_x);
        N = zeros(size(v_x,1), Number);
        M = zeros(size(v_x,1), Number);
        for j = 1:size(v_x,1)
            [m,n] = sort(subS(:,j));
            N(j,:) = n(2:1+Number,:)';
            M(j,:) = m(2:1+Number,:)';
        end
        %% compute SNN
        SNN = zeros(size(v_x,1), size(v_x,1));
        for k = 1:size(v_x,1)
            for l = k + 1:size(v_x,1)
                 SNN(k,l) = intersectx(N(k,:),N(l,:));
                 SNN(l,k) = SNN(k,l);
            end
        end
        
        %% compute local density
        rho = zeros(size(v_x,1),1);
        for k = 1:size(v_x,1)
            Num = 0;
            for l = 1:Number
                Num = Num+exp(-(subS(k,N(k,l))/(SNN(k,N(k,l))+1)));
            end 
            rho(k,1) = Num;
        end
        rho = (rho-min(rho))/(max(rho)-min(rho));
        
        
       %% compute weight
        rho = rho.*mVar(v_x);
        [~, index] = max(rho(:,1));
        selectedBand(i) = v_x(index);
        
        else
             [~, index] = max(mVar(v_x));
             selectedBand(i) = v_x(index); 
        end
end

end

