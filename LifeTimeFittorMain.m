function LifeTimeFittorMain
    clc; clear all; close all;
    addpath(genpath(fileparts(mfilename('fullpath'))));
   
    %% measured data file information
    fpath = './MeasuredData/24Ph/';
    savefilepath = './FittedData/24Ph/';
    IRFfname = '24Ph-IRF.txt';
    Datafname = '24Ph-2_TransientData.txt';
    MaterialName = '24Ph-2';
    
    if ismac
        fpath( fpath=='\' ) = '/';
        savefilepath = strcat(savefilepath,MaterialName,'/');
    else
        fpath( fpath=='/' ) = '\';
        savefilepath = strcat(savefilepath,MaterialName,'\');
    end
    %% set initial conditions
    % lifetime funcion = Bias + B1*exp(-(t-t0)/tau1) + B2*exp(-(t-t0)/tau2) + B3*exp(-(t-t0)/tau3) + .....   
    para.BList      = [  1.118370, 0.003497];  % the list of exponentials' coefficients
    para.BListBool  = [      true,     true];     % true : optimized, false : fixed
    para.TauList    = [  0.016760, 3.206402];    % the list of tau/lifetime
    para.TauListBool= [      false,     true];     % true : optimized, false : fixed
    
    para.Bias     = [0.000138];        % bias (single value)
    para.BiasBool = [true];     % true : optimized, false : fixed
    para.t0       = [0.011925];        % time shift
    para.t0Bool   = [true];     % true : optimized, false : fixed

    %% set fitting time range (unit : us)
    tstart = -0.2;
    tend = inf;
    
    %% convolution bool
    convBool = true;
    
    %% load file
    IRFdata = importdata( strcat( fpath, IRFfname ) );
    Data = importdata( strcat(fpath, Datafname) );
    
    mask = (IRFdata(:,1)>=tstart) & (IRFdata(:,1)<=tend);
    IRFdata = IRFdata(mask,:);
    mask = (Data(:,1)>=tstart) & (Data(:,1)<=tend);
    Data = Data(mask,:);
    
    % remove IRF noise
    cutoffratio = 2e-4;
    IRFdata( IRFdata(:,2)<=max(IRFdata(:,2))*cutoffratio, 2) = 0;
    
    %% plot data
    figure; AX = axes; hold all;
    plot( IRFdata(:,1), IRFdata(:,2), 'k', 'linewidth', 2);
    plot( Data(:,1), Data(:,2), 'b', 'linewidth', 2);
    set(AX, 'yscale', 'log')
    data = figdata( 'x_name','Time','x_unit','\mus',...
                    'y_name','Norm. Photon Counts',...
                    'title',MaterialName,...
                    'AXIS',[-inf inf 1e-5 1e1],...
                    'legend',{'IRF', MaterialName},'legend_location','Northeast');
    figureprocess(data,AX);
    if ~isfolder(savefilepath)
        mkdir(savefilepath);
    end
    my_jpg_save( strcat(savefilepath, MaterialName, '_Data_IRF') );
    
    %% fit data
    x0 = Btau_2_x(para);
    [BList, TauList, Bias, yfit] = LifeTimeFittor(IRFdata, Data, MaterialName, x0, para, convBool, savefilepath);
    rmpath(genpath(fileparts(mfilename('fullpath'))));

    
    