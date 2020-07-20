function  RecommandBand  = recomBand( selectedBand,img)

    selectedBand = sort(selectedBand);
    CorL = (img)*(img');
    Lz  =CorL(selectedBand,selectedBand);
    OptimalNumber = det(Lz);
    OptimalAllNumber = det(Lz+eye(size(Lz,1),size(Lz,1)));
    P = OptimalNumber/OptimalAllNumber;
    RecommandBand = P;
end

