function [bandSubspace] = subspacePart(S,Band,K)

bandSubspace = linspace(1,Band,K); 
bandSubspace = floor(bandSubspace); % coarse band grouping

R(1:Band) = inf; % record the value of each band to the center
L(1:Band) = 0;

for inter = 1:5
    for i = 2:length(bandSubspace)
        next = bandSubspace;
        class = i-1;
        index1 = floor((bandSubspace(i) - bandSubspace(i-1))/2);% The center of each subinterval is obtained as the cluster center
        t = bandSubspace(i-1) + index1;  %  current center
        ZL = [];
        ZR = [];
        indexL = [];
        indexR = [];

        if i == 2
           indexr = floor((bandSubspace(i+1) - bandSubspace(i))/2);
           tr = bandSubspace(i) + indexr; % get the distance to the next center (right)

           ZL = S(t,1:(t-1)); % the left of the class center     
           ZR = S((t+1):tr); % the right of the class center   

           indexL = find(ZL<R(1:(t-1)));
           R(indexL) = ZL(indexL);
           L(indexL) = class;

           indexR = find(ZR<R((t+1):tr));
           R(t+indexR) = ZR(indexR);
           L(t+indexR) = class;

        elseif i == length(bandSubspace)     
           indexl = floor((bandSubspace(i) - bandSubspace(i-1))/2);
           tl = bandSubspace(i-1) - indexl; % get the distance to the next center (left)

           ZL = S(t,tl:(t-1)); % the left of the class center       
           ZR = S(t,(t+1):Band); % the right of the class center 

           indexL = find(ZL<R(tl:(t-1)));
           R(tl+indexL) = ZL(indexL);       
           L(tl+indexL) = class;

           indexR = find(ZR<R((t+1):Band));
           R(t+indexR) = ZR(indexR);
           L(t+indexR) = class;    

        else
           indexr = floor((bandSubspace(i+1) - bandSubspace(i))/2);
           tr = bandSubspace(i) + indexr; % get the distance to the last center (right)

           indexl = floor((bandSubspace(i-1) - bandSubspace(i-2))/2);
           tl = bandSubspace(i-1)-indexl; % get the distance to the last center (left)

           if(tl < 1)
               tl = 1;
           end

           ZL = S(t,tl+1:(t-1)); % the left of the class center 
           ZR = S((t+1):tr-1); % the right of the class center     
           indexL = find(ZL<R(tl+1:(t-1)));
           R(tl+1+indexL) = ZL(indexL);       
           L(tl+1+indexL) = class;

           indexR = find(ZR<R((t+1):tr-1));
           R(t+indexR) = ZR(indexR);
           L(t+indexR) = class;
        end   
    end

    [~,t1] = find(L == 0);
    L(t1) = 1;

    %% remove noise
    for w = 1:K-1
        [~,m] = find(L == w);
        if isempty(m)
           m = bandSubspace(w)+1;
        end

        if m(1) ~= bandSubspace(w) + 1
            m = [bandSubspace(w)+1:m(1)-1,m];
        end
        % compute model
        index = 0;
        for j = 1:length(m) - 1
            if m(j+1)-m(j) > length(m(j+1:end))
                index = j;
                break;
            end
        end
        if index == 0
            L(m(1):m(end)) = w;
            bandSubspace(w+1) = m(end);
        else
            L(m(index+1:end)) = L(m(index+1)-1);
            L(m(1):m(index)) = w;
            bandSubspace(w+1) = m(index);
        end
    end
     if next == bandSubspace
         break;
    end

end
end