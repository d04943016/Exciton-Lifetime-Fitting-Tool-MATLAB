function x = Btau_2_x(para)
    x = [ para.BList(para.BListBool), ...
          para.TauList(para.TauListBool),... 
          para.Bias(para.BiasBool),...
          para.t0(para.t0Bool)];