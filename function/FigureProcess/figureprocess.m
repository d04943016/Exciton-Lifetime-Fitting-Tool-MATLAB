function figureprocess(data,axis_)
% FIGUREPROCESS is to manipulate the figure properties
% 
%   Example:
%     x = 1:10;
%     fig = figure; AX = axes;
%     plot(x,x);
%     data = figdata( 'x_name','x_test','x_unit','um',...
%                     'y_name','y_test','y_unit','mm',...
%                     'title','title_test',...
%                     'AXIS',[-inf inf -inf inf],...
%                     'legend','legend_test','legend_location','Northwest');
%     figureprocess(data,AX);
%    
%    avaliable optional :x_name, x_unit, x_fontsize, x_fontWeight,
%                        y_name, y_unit, y_fontsize, y_fontWeight,
%                        z_name, z_unit, z_fontsize, z_fontWeight,
%                        title, title_fontsize, title_fontWeight,
%                        axis, axis_fontsize, axis_fontWeight,
%                        axis_linewidth,
%                        legend, legend_fontsize, legend_fontWeight,
%                        legend_location,data.box_on_off
%   Default : fontsize = 20; fontWeight = 'Bold'; axis_linewidth = 2;
%
% 2015/09/01 have finished for a long time...., type usage and help
% Last modified by Wei-Kai, Lee, 2015/09/01
%
% Copyright(c) 2015 Wei-Kai, Lee All right reserved.
%
% See also figdata, my_jpg_save
%
%

    if nargin == 1
        axis_ = gca;
    end
    if isfield(data,'x_name')
        xlab = data.x_name;
        if isfield(data,'x_unit')
            xlab = strcat(xlab,'(',data.x_unit,')');
        end
        h = get(axis_,'XLabel');
        set(h,'String',xlab);
        if isfield(data,'x_fontsize')
            set(h,'Fontsize',data.x_fontsize)
        end
        if isfield(data,'x_fontWeight')
            set(h,'FontWeight',data.x_fontWeight)
        end
        if isfield(data,'xscale')
            set(axis_,'xscale',data.xscale)
        end
    end
    if isfield(data,'y_name')
        ylab = data.y_name;
        if isfield(data,'y_unit')
            ylab = strcat(ylab,'(',data.y_unit,')');
        end
        h = get(axis_,'YLabel');
        set(h,'String',ylab);
        if isfield(data,'y_fontsize')
            set(h,'Fontsize',data.y_fontsize)
        end
        if isfield(data,'y_fontWeight')
            set(h,'FontWeight',data.y_fontWeight)
        end
        if isfield(data,'yscale')
            set(axis_,'yscale',data.xscale)
        end
    end
    if isfield(data,'z_name')
        zlab = data.z_name;
        if isfield(data,'z_unit')
            zlab = strcat(zlab,'(',data.z_unit,')');
        end
        h = get(axis_,'ZLabel');
        set(h,'String',zlab);
        if isfield(data,'z_fontsize')
            set(h,'Fontsize',data.z_fontsize)
        end
        if isfield(data,'z_fontWeight')
            set(h,'FontWeight',data.z_fontWeight)
        end
        if isfield(data,'zscale')
            set(axis_,'zscale',data.xscale)
        end
    end
    if isfield(data,'title')
        h = get(axis_,'Title');
        set(h,'String',data.title);
        if isfield(data,'title_fontsize')
            set(h,'Fontsize',data.title_fontsize)
        end
        if isfield(data,'title_fontWeight')
            set(h,'FontWeight',data.title_fontWeight)
        end
    end
    % axis
    if isfield(data,'axis')
        axis(axis_,data.axis);
    end
    if isfield(data,'axis_fontsize')
        set(axis_,'FontSize',data.axis_fontsize);
    end
    if isfield(data,'axis_linewidth')
        set(axis_,'linewidth',data.axis_linewidth);
    end
    if isfield(data,'fontWeight')
        set(axis_,'FontWeight',data.fontWeight);
    end
    if isfield(data,'axis_box_on_off')
       set(axis_,'Box',data.axis_box_on_off);
    end
    % legend
    if isfield(data,'legend')
        leg = legend(axis_,data.legend);
        if isfield(data,'legend_fontsize')
            set(leg,'FontSize',data.legend_fontsize);
        end
        if isfield(data,'legend_fontWeight')
            set(leg,'FontSize',data.legend_fontWeight);
        end
        if isfield(data,'legend_location')
            set(leg,'location',data.legend_location);
        end
        if isfield(data,'legend_box_on_off')
            set(leg,'Box',data.legend_box_on_off);
        end
    end