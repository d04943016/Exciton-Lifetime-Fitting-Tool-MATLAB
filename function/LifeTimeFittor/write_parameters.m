function write_parameters(fpath, fname, x0, x, para, convBool, chisquare, r)
    if ~isfolder(fpath)
        mkdir(fpath);
    end
    %% open file
    fid = fopen( strcat(fpath, fname, '_parameters.txt'), 'wt' );
   %% write convBool
    fprintf(fid, 'Convolution Mode : ');
    if convBool
        fprintf(fid, 'on\n');
    else
        fprintf(fid, 'off\n');
    end
   %% write initial condition
    [B0List, Tau0List, Bias0, t00] = x_2_Btau(x0, para);
    fprintf(fid, 'Initial Conditions : \n');
    fprintf(fid, '============================================\n');
    fprintf(fid, 'B0 (exponential strength) : ');
    for B = B0List
        fprintf(fid, '%f ', B);
    end
    fprintf(fid, '\n');
    
    fprintf(fid, 'tau0 (lifetime, us) : ');
    for tau = Tau0List
        fprintf(fid, '%f ', tau);
    end
    fprintf(fid, '\n');
    fprintf(fid, 'Bias0 : %f\n', Bias0);
    fprintf(fid, 't00 : %f\n', t00);
    fprintf(fid, '\n');
    
   %% write fitted data
    [BList, TauList, Bias, t0] = x_2_Btau(x, para);
    fprintf(fid, 'Fitted Data : \n');
    fprintf(fid, '============================================\n');
    fprintf(fid, 'B (exponential strength) : ');
    for B = BList
        fprintf(fid, '%f ', B);
    end
    fprintf(fid, '\n');
    
    fprintf(fid, 'Normalized B (exponential strength) : ');
    for B = BList
        fprintf(fid, '%f ', B/sum(BList));
    end
    fprintf(fid, '\n');
    
    fprintf(fid, 'tau (lifetime, us) : ');
    for tau = TauList
        fprintf(fid, '%f ', tau);
    end
    fprintf(fid, '\n');
    
    fprintf(fid, 'Relative strength (%%) (B_i*tau_i/sum(B_i*tau_i)) : ');
    for ii = 1:length(TauList)
        fprintf(fid, '%f ', TauList(ii)*BList(ii)/sum(TauList.*BList) );
    end
    fprintf(fid, '\n');
    
    fprintf(fid, 'Bias : %f\n', Bias);
    fprintf(fid, 't0 : %f\n', t0);
    
    %% write error
    fprintf(fid, 'chisquare : %f \n', chisquare);
    fprintf(fid, 'Correlation coefficients : %f \n', r); 
    fclose(fid);
    
    
    
    
    