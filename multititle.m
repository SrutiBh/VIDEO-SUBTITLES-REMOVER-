function h = multititle(strings,fontname,fontsize)
% Examples: 
% multititle({'Performance','Memory Performance'},'times new roman',[14 8]);
% multititle({'Performance','Memory Performance'},{'times new roman','helvetica'},10);
% multititle({'Performance','Memory Performance'},{'times new roman','helvetica'},[14 8]);

g = gca; % Get handle to current axes
prevunits = get(g,'Units');
set(g,'Units','normalized');
axpos = get(g,'Position');
set(g,'Units',prevunits);
len = length(strings);

xpos = .5;
ypos = (axpos(2) + axpos(4))*(1.08+fliplr(0:.03:.03*(len-1)));

h = zeros(1,len);
for i = 1:len
    h(i) = text(...
        'String', strings{i},...
        'Position', [xpos,ypos(i),0],...
        'Units','normalized',...
        'HorizontalAlignment','center',...
        'VerticalAlignment','bottom',...
        'HandleVisibility','off');
    if iscell(fontname) && length(fontname) > 1
        set(h(i),'FontName',fontname{i});
    else
        set(h(i),'FontName',fontname);
    end
    if length(fontsize) > 1
        set(h(i),'FontSize',fontsize(i));
    else
        set(h(i),'FontSize',fontsize);
    end    
end
%set(g,'title',h(1));