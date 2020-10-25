function Value = findValue(data,key) 
%% findValue
% findValue is a function to find the value corresponding to key or 
%   the interpolation value. 
%   data is a structure including key and data. 
%
%   data.key must be sorted and ascending (key can be any string)
%   data.value is the corresponding value to x (value can be any string and can be many)
%   key is also a structure that contains keystr, key and valuestr
%       key.keystr   : the string of the key name 
%       key.key      : the value of the key
%       key.valuestr : the string of the value name 
%   This function 
%  
%   For example:  
%       data.x       = 0:0.01:10;      % x is as the key in data
%       data.exp     = e.^(x);         % data has two y corresponding the same x (exp and exps)
%       data.exps    = e.^(2*x);
%       data.b       = 0:0.01:20;      % b is as another key in data but not the key needed
%       data.bexp    = e.^(b);         % data has two y corresponding the same b (bexp and bexps)
%       data.bexps   = e.^(2*b);
%       key.keystr   = 'x';            % the key string
%       key.key      = 1.088;          % key value
%       key.valuestr = {{'exp','exps'}}; % y strings that want to be found or be interpolated       
%       Value = findValue(data,key);   % Value would be a vector with two components that corresponds to exp and exps separately
%       
%
% 2015/09/01 have finished for a long time...., type usage and help
% Last modified by Wei-Kai, Lee, 2015/09/01
%
% Copyright(c) 2015 Wei-Kai, Lee All right reserved.
%
% see also my_binary_search
%
    [index,find] = my_binary_search(data.(key.keystr),key.key);
    Value = zeros(1,length(key.valuestr));
    if index == -1
        for ii = 1:length(Value)
            Value(ii) = -inf;
        end
    else
        for ii = 1:length(Value)
            if (find)
                Value(ii) = data.(key.valuestr{ii})(index);
            else
                Value(ii) = data.(key.valuestr{ii})(index) + ...
                       (data.(key.valuestr{ii})(index+1)-data.(key.valuestr{ii})(index))*...
                              (key.key-data.(key.keystr)(index))./(data.(key.keystr)(index+1)-data.(key.keystr)(index));
            end
        end
    end
    
    
    