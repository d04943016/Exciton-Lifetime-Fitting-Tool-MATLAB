function chisquare = ChiSquare( ydata, yfit)
    index = (ydata>0);
    chisquare = sum( (yfit(index) - ydata(index)).^2./ydata(index) );