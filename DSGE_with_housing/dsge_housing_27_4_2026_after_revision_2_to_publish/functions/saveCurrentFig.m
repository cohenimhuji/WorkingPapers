function output = saveCurrentFig(name)
    disp('Please select the figure you want to save');
    pause();
    h=gcf;
    exportgraphics(h,[name,'.pdf'])
    exportgraphics(h,[name,'.png'],'Resolution',600)     
end
