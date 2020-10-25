function y = MyMultiExponentialWithSource( IRFdata, BList, TauList, bias, t )
    ytempt = MyMultiExponential( BList, TauList, t );
    y = ytempt + bias;