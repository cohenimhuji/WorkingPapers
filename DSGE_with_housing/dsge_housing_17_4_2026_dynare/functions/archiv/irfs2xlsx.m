
function [ ] = irfs2xlsx(filename, M_, oo_ )
    % Save all simulation, parameters, steady state values and IRFs to an excel file
    % Works after stochastic simulation (stoch_simul)
    % input:
    %   filename: name of the excel file
    %   M_: dynare model structure
    %   oo_: dynare output structure
    % output:
    %   excel file with 4 sheets:
    %       General: file name, dynare version
    %       Parameters: parameter names, long names, tex names and values
    %       Exo: exogenous variable names, long names, tex names and steady state values
    %       Endo: endogenous variable names, long names, tex names and steady state values
    %       IRFs: period, IRF names and values
    % 
	% Very usefull!
    % Nimrod Cohen 2021-2023
    filename = [filename '.xlsx'];               
    writecell({'file name (.mod)' , M_.dname}, filename,'Sheet','General','Range','A1')
    writecell({'file name (.mod)' , M_.fname}, filename,'Sheet', 'General', 'Range','A2');
    writecell({'dynare_version' , M_.dynare_version}, filename, 'Sheet', 'General', 'Range','A3');

    writecell({'Parameters' ; 'Long Name'; 'Tex Name';'Value'}, filename, 'Sheet', 'Parameters','Range', 'A1');
    writecell(cellstr(M_.param_names)', filename, 'Sheet', 'Parameters', 'Range','B1');
    writecell(cellstr(M_.param_names_long)', filename, 'Sheet', 'Parameters', 'Range', 'B2');
    writecell(cellstr(M_.param_names_tex)', filename, 'Sheet', 'Parameters', 'Range', 'B3');
    writecell(num2cell(M_.params'), filename, 'Sheet', 'Parameters', 'Range', 'B4'); 

    writecell({'Exo Varibles' ; 'Long Name'; 'Tex Name';'steady_state'}, filename,'Sheet', 'Exo', 'Range', 'A1');
    writecell(cellstr(M_.exo_names)', filename, 'Sheet', 'Exo', 'Range', 'B1');
    writecell(cellstr(M_.exo_names_long)',filename, 'Sheet', 'Exo', 'Range', 'B2');
    writecell(cellstr(M_.exo_names_tex)', filename, 'Sheet', 'Exo', 'Range', 'B3');
    writecell(num2cell(oo_.exo_steady_state'), filename, 'Sheet', 'Exo', 'Range', 'B4');

    writecell({'Endo Varibles' ; 'Long Name'; 'Tex Name';'steady_state'}, filename, 'Sheet','Endo', 'Range', 'A1');
    writecell(cellstr(M_.endo_names)', filename, 'Sheet','Endo', 'Range', 'B1');
    writecell(cellstr(M_.endo_names_long)', filename, 'Sheet', 'Endo', 'Range', 'B2');
    writecell(cellstr(M_.endo_names_tex)', filename, 'Sheet', 'Endo', 'Range', 'B3');
    writecell(num2cell(oo_.steady_state'), filename, 'Sheet', 'Endo', 'Range', 'B4');
    
    % transform irfs stracture to matrix
    temp_irfs = struct2cell(oo_.irfs);    
    irfs_values = vertcat(temp_irfs{:})';
    % Note that period=0 is the first period - where the shock is applied, so the last periofd is:
    LastPeriod = size(irfs_values',2)-1 ;

    writecell({'Period'}, filename, 'Sheet', 'IRFs', 'Range', 'A1');
    writecell(num2cell([0:LastPeriod]'), filename, 'Sheet', 'IRFs', 'Range', 'A2');
    % endo varibels names with exo suffix
    writecell(fieldnames(oo_.irfs)', filename, 'Sheet', 'IRFs', 'Range', 'B1');
    % values
    writecell(num2cell(irfs_values), filename, 'Sheet', 'IRFs', 'Range', 'B2');

end