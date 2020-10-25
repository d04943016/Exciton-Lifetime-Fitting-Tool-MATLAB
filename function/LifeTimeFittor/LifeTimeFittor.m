function [BList, TauList, Bias, yfit] = LifeTimeFittor(IRFdata, Data, MaterialName, x0, para, convBool, savefilepath)
    fprintf('==================================================================\n');
    fprintf('Now fitting material : %s\n', MaterialName);
    
    %% start fitting
    chifun = @(x) ChiSquareX( Data, IRFdata, x, para, convBool);
    %options = optimset('Display','iter','PlotFcns',@optimplotfval);
    options = optimset('Display','off','PlotFcns',@optimplotfval);
    x = fminsearch( chifun, x0, options);
    [BList, TauList, Bias, t0] = x_2_Btau(x, para);
    
     %% post processing
    t = Data(:, 1);
    ydata = Data(:, 2);
    
    yfit = yfit_function( IRFdata, BList, TauList, Bias, t0, t, convBool );
    ExponentialNum = length(BList);
    
    savefilename = strcat(MaterialName, sprintf('_%dexp',ExponentialNum) );
    plotDataAndFit( t, ydata, yfit, MaterialName );
    for ii = 1:length(BList)
        yfit_tempt = yfit_function( IRFdata, [BList(ii)], [TauList(ii)], 0, t0, t, convBool );
        plot(t, abs( yfit_tempt ), '--', 'linewidth', 2)
    end
    my_jpg_save( strcat(savefilepath, savefilename, '_MeasuredFitted') );
    
    plot_chisquare_time(t, ydata, yfit, MaterialName)
    my_jpg_save( strcat(savefilepath, savefilename, '_chisquare_time') );
    
    plot_residuals_time(t, ydata, yfit, MaterialName )
    my_jpg_save( strcat(savefilepath, savefilename, '_residuals_time') );
    
     %% save data
    chisquare = chifun(x);
    r = corrcoef(ydata, yfit);
    write_parameters(savefilepath, savefilename, x0, x, para, convBool, chisquare, r(1,2));
    write_data_and_fitted_data(savefilepath, savefilename, t, ydata, yfit);
    
    %% print information
    fprintf('B (exponential strength) : ');
    for B = BList
        fprintf('%f ', B);
    end
    fprintf('\n');
    
    fprintf('Normalized B (exponential strength) : ');
    for B = BList
        fprintf('%f ', B/sum(BList));
    end
    fprintf('\n');
    
    fprintf('tau (lifetime, us) : ');
    for tau = TauList
        fprintf('%f ', tau);
    end
    fprintf('\n');
    fprintf('Bias : %f\n', Bias);
    fprintf('t0 : %f\n', t0);
    
    fprintf('chisquare : %f \n', chisquare);
    fprintf('Correlation coefficients : %f \n', r(1,2)); 