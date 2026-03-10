% Function: combine_mods 
% Description: This function takes list of .mod file names as input, reads the contents of the files, 
% combines them into a new file with a unique name, runs the Dynare program on the new file, 
% and returns the output. 
% Inputs: 
    % - fnames: list of names to be combined
% Outputs: 
    % - out: the output of the Dynare program
function out = combine_mods(fnames, combined_name)
    
    % Check if the combined_name argument was provided    
    if nargin < 2
        combined_name = 'combined.mod';
    end

    % Open the new file for writing
    combined_file = fopen(combined_name, 'wt');
    
    % Write the contents of all files to the new combined file
    for i = 1 : length(fnames)        
        % Read the contents of the file
        content = readlines(fnames{i});
        
        % Write the contents of the file to the new file
        fprintf(combined_file, '%s\n', content);
    end      
    % Close the new file
    fclose(combined_file);
 
    % Run the Dynare program on the new file and store the output in the 'out' variable
    file_name = combined_name(1 : end - 4);
    out = dyn(file_name);
   

    % save stracture out to a mat file
    % save(strcat(mod_file, '.mat'), out);
    %disp(strcat(mod_file, '.mat'));
    % open variable: out
    %openvar('out');
    %out = combined_name;

end