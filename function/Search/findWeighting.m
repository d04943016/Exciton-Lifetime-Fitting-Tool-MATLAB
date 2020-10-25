function [index,weighting] = findWeighting(List,key,Order)
    %
    %
    %
    % List{1} = [  0,   1,   2,   3,   4,   5,  6,  7,  8,  9,  10];
    % List{2} = [1.1, 1.2, 1.3, 1.4, 1.5, 1.6];
    % List{3} = [ -5,  -4,  -3,  -2];
    %
    % key   = [2.3,1.44,-3.28];
    % Order = [  1,   2,    2]; 
    %  
    % [index,weighting] = findWeighting(List,key,Order);
    %
    % Result :
    % index     = [ 3,  4,  2];
    % weighting = [  ,   ,   ];
    %
    %
    
    for ii = 1:length(key)
        index(ii) = my_binary_search(List(ii,:),key(ii));
    end
    
    
    
    
    