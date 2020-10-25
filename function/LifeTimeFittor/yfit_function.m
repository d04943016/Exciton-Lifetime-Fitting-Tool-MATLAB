function ydata = yfit_function( IRFdata, BList, TauList, Bias, t0, t, convBool )
    if ~convBool
        ydata = MyMultiExponential( BList, TauList, t-t0 ) + Bias;
    else
        yexp = MyMultiExponential( BList, TauList, IRFdata(:,1)-IRFdata(1,1) );
        yconv = conv(yexp, IRFdata(:,2)) + Bias;

        dt = IRFdata(2,1)-IRFdata(1,1);
        data.t       = IRFdata(1,1) + dt * (0:(length(yconv)-1)); 
        data.yconv   = yconv;
        key.keystr   = 't';           

        ydata = zeros( length(t), 1);
        for ii = 1:length(t)
            key.key      = t(ii)-t0;          % key value
            key.valuestr = {'yconv'}; % y strings that want to be found or be interpolated       
            Value = findValue(data,key);   % Value would be a vector with two components that corresponds to exp and exps separately
            if isinf(Value)
                Value = 0;
            end
            ydata(ii) = Value;
        end
    end