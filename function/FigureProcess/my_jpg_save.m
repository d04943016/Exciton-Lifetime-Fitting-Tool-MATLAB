function my_jpg_save(filename,h,type)
%% my_jpg_save
%   my_jpg_save is a function to save the figure as a picture in the
%   specified directory/computer without graphic user interface(GUI).
%   (PS resolution : 600dpi)
%
%   filename       : picture's file name
%   h(optinal)     : figure handle
%   type(optional) : save file type (must be a string)
%                    'JPEG', 'BMP', 'PDF', 'PNG', 'TIFF'
%                    default: 'JPEG'
%
%   For example:
%       h = figure;
%       x = -5:0.1:5;
%       plot(x,sin(x));
%       data = figdata( 'x_name','x','y_name','sin(x)',...
%                       'AXIS',[-inf inf -inf inf]);
%       figureprocess(fig,data);
%       my_jpg_save('./myfun/sin(x)',h,'tiff');
%       my_jpg_save('./myfun/sin(x)');
%       
% 2015/09/01 have finished for a long time...., type usage and help
% Last modified by Wei-Kai, Lee, 2015/09/01
%
% Copyright(c) 2015 Wei-Kai, Lee All right reserved.
%
% see also figdata, figureprocess
%
    if nargin == 1
        type = 'JPEG';
        h = gcf;
    elseif nargin == 2
        type = 'JEPG';
    end
    switch upper(type)
        case 'JPEG'
            print(h,'-djpeg','-r300',filename);
        case 'BMP'
            print(h,'-dbmp16m','-r300',filename);
        case 'PDF'
            print(h,'-dpdf','-r300',filename);
        case 'PNG'
            print(h,'-dpng','-r300',filename);
        case 'TIFF'
            print(h,'-dtiff','-r300',filename);
        otherwise
            print(h,'-djpeg','-r300',filename);
    end  