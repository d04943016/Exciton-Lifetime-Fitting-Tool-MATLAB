function y = MyMultiExponential( BList, TauList, t )
    y = zeros( length(t), 1 );
    idx = (t>=0);
    for ii = 1:length(BList)
        B = BList(ii);
        tau = TauList(ii);
        y(idx) = y(idx) + B * exp( -t(idx)/tau );
    end
