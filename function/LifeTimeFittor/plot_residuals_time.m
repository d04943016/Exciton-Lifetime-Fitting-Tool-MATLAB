function plot_residuals_time(t, ydata, yfit, Mname )
    figure; AX = axes; hold all;
    plot( t, Residuals( ydata, yfit), 'k', 'linewidth', 2);
    
	data = figdata( 'x_name','Time','x_unit','\mus',...
                    'y_name','residuals (t)','title',Mname);
    figureprocess(data,AX);
