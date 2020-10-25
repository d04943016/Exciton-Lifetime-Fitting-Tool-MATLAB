function data = figdata(varargin)
% FIGDATA return data which is a structrure for FIGUREPROCESS (a function)
%   to manipulate the figure properties
% 
%   Example:
%     x = 1:10;
%     fig = figure;
%     AX  = axes;
%     plot(x,x);
%     fig_data = figdata( 'x_name','x_test','x_unit','\mum',...
%                     'y_name','y_test','y_unit','mm',...
%                     'title','title_test',...
%                     'AXIS',[-inf inf -inf inf],...
%                     'legend','legend_test','legend_location','Northwest');
%     figureprocess(fig_data,AX);
%    
%   avaliable optional : x_name, x_unit, x_fontsize, x_fontWeight, xscale
%                        y_name, y_unit, y_fontsize, y_fontWeight, yscale
%                        z_name, z_unit, z_fontsize, z_fontWeight, zscale
%                        title, title_fontsize, title_fontWeight,
%                        axis, axis_fontsize, axis_fontWeight,
%                        axis_linewidth,axis_box_on_off
%                        legend, legend_fontsize, legend_fontWeight,
%                        legend_location,legend_box_on_off
%   Default : fontsize = 20; fontWeight = 'Bold'; axis_linewidth = 2;
%             axis_box_on_off = 'on'
%
% 2015/09/01 have finished for a long time...., type usage and help
% Last modified by Wei-Kai, Lee, 2015/09/01
%
% Copyright(c) 2015 Wei-Kai, Lee All right reserved.
%
% See also figureprocess, my_jpg_save
%
    data = struct();
    data.x_fontsize = 16;
    data.y_fontsize = 16;
    data.z_fontsize = 16;
    data.title_fontsize = 16;
    data.axis_fontsize = 16;
    data.legend_fontsize = 16;
    data.x_fontWeight = 'Bold';
    data.y_fontWeight = 'Bold';
    data.z_fontWeight = 'Bold';
    data.title_fontWeight = 'Bold';
    data.axis_fontWeight = 'Bold';
    data.axis_fontWeight = 'Bold';
    data.axis_linewidth  = 2;
    data.axis_box_on_off = 'on';
    while ~isempty(varargin)
        switch upper(varargin{1})
            case 'X_NAME'
                data.x_name = varargin{2};
                varargin(1:2) = [];
            case 'X_UNIT'
                data.x_unit = varargin{2};
                varargin(1:2) = [];
            case 'X_FONTSIZE'
                data.x_fontsize = varargin{2};
                varargin(1:2) = [];
            case 'X_FONTWEIGHT'
                data.x_fontWeight = varargin{2};
                varargin(1:2) = [];
            case 'XSCALE'
                data.xscale   = varargin{2};
                varargin(1:2) = [];
            case 'Y_NAME'
                data.y_name = varargin{2};
                varargin(1:2) = [];
            case 'Y_UNIT'
                data.y_unit = varargin{2};
                varargin(1:2) = [];
            case 'Y_FONTSIZE'
                data.y_fontsize = varargin{2};
                varargin(1:2) = [];
            case 'Y_FONTWEIGHT'
                data.y_fontWeight = varargin{2};
                varargin(1:2) = [];
            case 'YSCALE'
                data.yscale   = varargin{2};
                varargin(1:2) = [];
            case 'Z_NAME'
                data.z_name = varargin{2};
                varargin(1:2) = [];
            case 'Z_UNIT'
                data.z_unit = varargin{2};
                varargin(1:2) = [];
            case 'Z_FONTSIZE'
                data.z_fontsize = varargin{2};
                varargin(1:2) = [];
            case 'Z_FONTWEIGHT'
                data.z_fontWeight = varargin{2};
                varargin(1:2) = [];
            case 'ZSCALE'
                data.zscale   = varargin{2};
                varargin(1:2) = [];
            case 'TITLE'
                data.title = varargin{2};
                varargin(1:2) = [];
            case 'TITLE_FONTSIZE'
                data.title_fontsize = varargin{2};
                varargin(1:2) = [];
            case 'TITLE_FONTWEIGHT'
                data.title_fontWeight = varargin{2};
                varargin(1:2) = [];
            case 'AXIS'
                data.axis = varargin{2};
                varargin(1:2) = [];
            case 'AXIS_FONTSIZE'
                data.axis_fontsize = varargin{2};
                varargin(1:2) = [];
            case 'AXIS_FONTWEIGHT'
                data.axis_fontWeight= varargin{2};
                varargin(1:2) = [];
            case 'AXIS_LINEWIDTH'
                data.axis_linewidth = varargin{2};
                varargin(1:2) = [];
            case 'AXIS_BOX_ON_OFF'
                data.axis_box_on_off = varargin{2};
                varargin(1:2) = [];
            case 'LEGEND'
                data.legend = varargin{2};
                varargin(1:2) = [];
            case 'LEGEND_FONTSIZE'
                data.legend_fontsize = varargin{2};
                varargin(1:2) = []; 
            case 'LEGEND_FONTWEIGHT'
                data.legend_fontWeight = varargin{2};
                varargin(1:2) = []; 
            case 'LEGEND_LOCATION'
                data.legend_location = varargin{2};
                varargin(1:2) = []; 
            case 'LEGEND_BOX_ON_OFF'
                data.legend_box_on_off = varargin{2};
                varargin(1:2) = [];
            otherwise
                exception = MException('UNEXOECTED PROPERTY');
                throw(exception);
        end
    end