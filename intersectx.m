function [ Num ] = intersectx( M,N )

Num=0;
  for i=1:length(M)
          Num=Num+length(find(N==M(i)));
  end
  
end

