# Exciton-Lifetime-Fitting-Tool-MATLAB
Extract the multi-exponential lifetimes from experiments <br/>
This program is built on MATLAB and the main function is in LifeTimeFittorMain.m. <br/>
There are four parts need to be modified/specified to fit the experimental data in LifeTimeFittorMain.m. <br/>

#### First,

    %% measured data file information
    fpath = './data/';
    savefilepath = './data/'. 
    IRFfname = 'test_IRF.txt';
    Datafname = 'testdata.txt';
    MaterialName = 'text';
    
fpath is the directory of the experimental data and the excitation light source.  <br/>
savefilepath is the directory to save the extracted data. <br/>
IRFfname is the file name of the excitation light source (IRF). <br/>
Datafname is the file name of the experimental data. <br/>
MaterialName is the material's name. <br/>



#### Second, 
    
    %% set initial conditions
    % lifetime funcion = Bias + B1*exp(-(t-t0)/tau1) + B2*exp(-(t-t0)/tau2) + B3*exp(-(t-t0)/tau3) + .....   
    para.BList      = [  1.118370, 0.003497];   % the list of exponentials' coefficients
    para.BListBool  = [      true,     true];   % true : optimized, false : fixed
    para.TauList    = [  0.016760, 3.206402];   % the list of tau/lifetime (e.x. unit : us)
    para.TauListBool= [      false,    true];   % true : optimized, false : fixed
    
    para.Bias     = [0.000138];        % bias (single value)
    para.BiasBool = [true];            % true : optimized, false : fixed
    para.t0       = [0.011925];        % time shift (e.x. unit : us)
    para.t0Bool   = [true];            % true : optimized, false : fixed
    
    
set the initial condition of the exponents. <br/>
BList is the prefactors of the exponenets. <br/>
TauList is the exciton lifetime of the exponents. <br/>
The length of the parameters is equal to the number of exponents. <br/>
<br/>
Bias is the bias value/error level. <br/>
t0 is the time difference between the experimental data and the excitation light source (IRF). (time shift) <br/>
Bool lists are used to specified whether the corresponding parameters need to be fitted or not.  <br/>





#### Third, 

    %% set fitting time range (e.x. unit : us)
    tstart = -0.2;
    tend = inf;
    
    

#### Last,

    %% convolution bool
    convBool = true;
    
convBool: True:  multiexponential decays (lifetime funcion) would convolute with excitation light source (IRF).   <br/>
                 i.e. predicted function = lifetime funcion * IRF <br/>
And the parameters are determined by minimizing chisquare = sum( (yfit(index) - ydata(index)).^2./ydata(index) ). <br/>
    
    
All the results would be saved in the specified save file path, and also show on the MATLAB command line.

<img src="https://github.com/d04943016/Exciton-Lifetime-Fitting-Tool-MATLAB/blob/main/Test/Test/CommandLine.jpg" width="800"/>




