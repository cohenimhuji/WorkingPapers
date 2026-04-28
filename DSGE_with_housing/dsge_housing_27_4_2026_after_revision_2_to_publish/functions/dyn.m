% Function: dyn 
% % Description: This function takes in a file name as input, runs the Dynare program on the file, and returns the output. 
% % Inputs: 
% % - mod_file: the name of the file to be run 
% % - clear: (optional) a flag indicating whether to clear the workspace before running the file (default is true) 
% % - del: (optional) a flag indicating whether to delete the generated files after running the file (default is true) 
% % Outputs: 
% % - out: a struct containing the output of the Dynare program. returns the oo_ and M_ structures. It also returns the mod file as a string.

function out = dyn(mod_file, clear, del)

    % Turn off warning about declaring global variables before use
    warning('off', 'MATLAB:declareGlobalBeforeUse')
    
    % Declare global variables
    global options_ oo_ M_ ; % Yaacov  - why did you declare mod_file as global? it is not used anywhere in the code
    %global mod_file;
    % Remove any existing directory with the same name as the model file
    try
    %%    [~,~]=rmdir(['+',M_.fname],'s');
    catch
    end
    
    % Read the contents of the model file and store them in the output struct
    out.model_file = fileread(strcat(mod_file, '.mod'));
    
    options_.LaTeX=1;
    % Run the Dynare program on the model file
    eval(['dynare ', mod_file]) % run dynare
    
    % Save IRFs to a .xlsx file with the same name as the model file
    disp(mod_file);
    irfs2xlsx(mod_file, M_, oo_ );

    % Store the output of the Dynare program in the output struct
    out.oo_ = oo_;
    out.M_ = M_; 
end
