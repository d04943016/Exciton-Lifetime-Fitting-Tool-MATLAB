function [index,find] = my_binary_search(vec,key)
%% my_binary_search
%   my_binary_search is a function to do binary search whether key is in 
%   a sorted ascending vector or not. If the key is in the vector, this
%   function would return the index and find = true. If the key is not in
%   the vector, it would return the index of the value of the largest value
%   that is smalller than key and find = false. However, if the key is
%   smaller than the smallest value in vector, then if would return return
%   index = -1 and find = false. 
%   
%
%   For example:
%     vec = 0:0.1:10;
%     key = 5.5;
%     [index,find] = my_binary_search(vec,key);
%     %% index = 56, find = true
%     key = 5.51;
%     [index,find] = my_binary_search(vec,key);
%     %% index = 56, find = false    
%       
% 2015/09/01 have finished for a long time...., type usage and help
% Last modified by Wei-Kai, Lee, 2015/09/01
% 2016/07/19 modified boundary process
%
% Copyright(c) 2015 Wei-Kai, Lee All right reserved.
%
% see also findValue
%
%
%
    imax = length(vec);
    imin = 1;
    find = false;
    % Special Case : Key is not in the range of vec
    if (vec(imax) < key )
        index = imax;
        return;
    elseif (vec(imin) > key )
        index = -1;
        return;
    end
    % Binary Search
    while (imax>=imin)
        mid = floor((imax+imin)/2);
        if ( vec(mid) == key )
            index = mid;
            find  = true;
            return;
        elseif ( vec(mid) < key )
            imin = mid + 1;
        else 
            imax = mid - 1;
        end
    end
    if vec(imin)>key
        index = imin - 1;
    else
        index = imin;
    end   
    
    
    
    
    
    
    
    
    