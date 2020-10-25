function chisquare = ChiSquareX( Data, IRFdata, x, para, convBool)   
    %% extract ydata
    t = Data(:, 1);
    ydata = Data(:, 2);
    
    %% calculate y fit from x
    [BList, TauList, Bias, t0] = x_2_Btau(x, para);
    yfit = yfit_function( IRFdata, BList, TauList, Bias, t0, t, convBool );
   
    %% calculate chisquare
    if convBool 
        chisquare = ChiSquare( ydata, yfit);
    else
        index = (t>=t0);
        chisquare = ChiSquare( ydata(index), yfit(index));
    end
    
    
    