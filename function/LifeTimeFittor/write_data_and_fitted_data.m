function write_data_and_fitted_data(fpath, fname, t, ydata, yfit)
    if ~isfolder(fpath)
        mkdir(fpath);
    end
    
    R = Residuals( ydata, yfit);
    fid = fopen( strcat(fpath, fname, '_time_data.txt'), 'wt' );
    fprintf(fid, '%20s %20s %20s %20s %20s\n', 'time(us)', 'measured', 'fitted', 'chisquare', 'residuals');
    for ii = 1:length(t)
        fprintf(fid, '%20.10f %20.10f %20.10f %20.10f %20.10f \n', t(ii), ydata(ii), yfit(ii), (ydata(ii)-yfit(ii))^2/ydata(ii), R(ii));
    end
    fclose(fid);