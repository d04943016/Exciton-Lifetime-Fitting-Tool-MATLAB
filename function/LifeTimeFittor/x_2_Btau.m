function [BList, TauList, Bias, t0] = x_2_Btau(x, para)
    %% initial conditions
    BList = para.BList;
    TauList = para.TauList;
    Bias = para.Bias;
    t0 = para.t0;
    %% updata
    num1 = 1;
    num2 = sum(para.BListBool);
    BList( para.BListBool ) = x( num1:num2 );
    
    num1 = num2+1;
    num2 = num1 + sum(para.TauListBool) -1;
    TauList( para.TauListBool ) = x( num1:num2 );
    
    num1 = num2+1;
    num2 = num1 + sum(para.BiasBool) -1;
    Bias(para.BiasBool) = x( num1:num2 );
    
    num1 = num2+1;
    num2 = num1 + sum(para.t0Bool) -1;
    t0(para.t0Bool) = x( num1:num2 );
    
    