function R = Residuals( ydata, yfit)
    R = (ydata - yfit)./ (ydata).^0.5;