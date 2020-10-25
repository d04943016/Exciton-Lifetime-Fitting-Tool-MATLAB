function plot_chisquare_time(t, ydata, yfit, Mname )
    figure; AX = axes; hold all;
    plot( t, (yfit - ydata).^2./ydata, 'k', 'linewidth', 2);
    
	data = figdata( 'x_name','Time','x_unit','\mus',...
                    'y_name','\chi^2 (t)','title',Mname);
    figureprocess(data,AX);
    set(AX, 'yscale', 'log')