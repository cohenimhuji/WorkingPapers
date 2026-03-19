function [] = d(mod_file)
    try
    [~,~]=rmdir(['+',mod_file],'s');
    [~,~]=rmdir([mod_file],'s');
    catch
    end
    eval(['dynare ', mod_file]);

end
