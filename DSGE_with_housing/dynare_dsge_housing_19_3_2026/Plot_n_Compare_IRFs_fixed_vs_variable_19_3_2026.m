% Baseline (fixed) vs Baseline (variable) IRF comparison (Figure 5 analog)
% Re-runs Dynare for both variants and plots eps_CB IRFs for the Figure-5 variable set.

clear
close all
addpath('functions');

root_dir = pwd;
cleanup_cd = onCleanup(@() cd(root_dir));

% --- Build baseline (fixed)
fixed_dir = fullfile(root_dir, 'fixed');
cd(fixed_dir);


Baseline_fixed_nc = combine_mods({ ...
    'A_Declaration.mod', 'B_Calibration_005.mod', 'C_Model.mod', ...
    'D_SS.mod', 'E_Shocks.mod', 'F_Irfs.mod'}, ...
    'Baseline_fixed_nc.mod');


% --- Build baseline (variable)
variable_dir = fullfile(root_dir, 'variable');
cd(variable_dir);

Baseline_variable_nc = combine_mods({ ...
    'A_Declaration.mod', 'B_Calibration_005.mod', 'C_Model.mod', ...
    'D_SS.mod', 'E_Shocks.mod', 'F_Irfs.mod'}, ...
    'Baseline_variable_nc.mod');


% --- Back to root for plotting/output
cd(root_dir);

Variabels_4_4 = {'LY','DP_cpi_a', 'r_a', 'rL_a', ... 
                'Lh_o',  'Lh_r','LC', 'L_h_inv', ...
                'Lh_o_tag','Lh_r_tag','LC_tag', 'LB_tag', ...
                'DP_r_a', 'Lr', 'Lq', 'LB_tag_n'};

shock_list = {'eps_CB'};

models = {Baseline_fixed_nc, Baseline_variable_nc};
leg_cel = {'Fixed-Rate Mortgage', 'Variable-Rate Mortgage'};

% --- Strict validation
for m = 1:numel(models)
    exo_names = cellstr(models{m}.M_.exo_names);
    if ~any(strcmp(shock_list{1}, exo_names))
        error('Missing shock "%s" in model "%s".', shock_list{1}, models{m}.M_.fname);
    end
end

endo_fixed = cellstr(Baseline_fixed_nc.M_.endo_names);
endo_var   = cellstr(Baseline_variable_nc.M_.endo_names);

for var = 1:numel(Variabels_4_4)
    var_name = Variabels_4_4{var};
    if ~any(strcmp(var_name, endo_fixed))
        error('Missing variable "%s" in fixed baseline model (%s).', var_name, Baseline_fixed_nc.M_.fname);
    end
    if ~any(strcmp(var_name, endo_var))
        error('Missing variable "%s" in variable baseline model (%s).', var_name, Baseline_variable_nc.M_.fname);
    end
    irf_field = [var_name, '_', shock_list{1}];
    if ~isfield(Baseline_fixed_nc.oo_.irfs, irf_field)
        error('Missing IRF field "%s" in fixed baseline model (%s).', irf_field, Baseline_fixed_nc.M_.fname);
    end
    if ~isfield(Baseline_variable_nc.oo_.irfs, irf_field)
        error('Missing IRF field "%s" in variable baseline model (%s).', irf_field, Baseline_variable_nc.M_.fname);
    end
end

% --- Plot (Figure 5 style)
ss = 0;
nvars = numel(Variabels_4_4);
dims = [ceil(sqrt(nvars)), ceil(sqrt(nvars))];
if nvars <= (dims(1) * (dims(2) - 1))
    dims(2) = dims(2) - 1;
end

for shock = 1:numel(shock_list)
    shockName = shock_list{shock};

    figure('Units', 'inches', 'Position', [0 0 9 9]);
    set(gcf, 'Name', ['Impulse Response: ', shockName], 'NumberTitle', 'off');
    sgtitle(['Shock: ', shockName], 'Interpreter', 'latex', 'FontSize', 20);

    tcl = tiledlayout(dims(1), dims(2));
    tcl.TileSpacing = 'compact';
    tcl.Padding     = 'none';

    for var = 1:nvars
        var_name = Variabels_4_4{var};
        ax = nexttile(tcl);

        irf_field = [var_name, '_', shockName];
        irf_fixed = Baseline_fixed_nc.oo_.irfs.(irf_field);
        irf_var   = Baseline_variable_nc.oo_.irfs.(irf_field);

        if numel(irf_fixed) ~= numel(irf_var)
            error('IRF length mismatch for "%s": fixed=%d, variable=%d.', irf_field, numel(irf_fixed), numel(irf_var));
        end

        mat_plot = [ ...
            irf_fixed(:) + ss * Baseline_fixed_nc.oo_.steady_state(find(strcmp(var_name, endo_fixed), 1)), ...
            irf_var(:)   + ss * Baseline_variable_nc.oo_.steady_state(find(strcmp(var_name, endo_var), 1))];

        plt = plot(ax, mat_plot, 'LineWidth', 2.5);
        styles = cellstr(get(0, 'DefaultAxesLineStyleOrder'));
        styles = styles(:);
        styles_to_apply = styles(1:numel(plt));         
        colors = get(0, 'DefaultAxesColorOrder');
        colors_to_apply = colors(1:numel(plt), :);
        colors_cell = num2cell(colors_to_apply, 2);
        set(plt, {'LineStyle'}, styles_to_apply, {'Color'}, colors_cell);

        ax.XLim = [1 ax.XLim(2)];
        ytickformat(ax, '%.4g');
        ax.YAxis.Exponent = 0;
        %ax.FontName = 'century';
        hold(ax, 'on');
        if ss == 0
            plot(ax, zeros(numel(irf_fixed), 1), 'Color', [0.498, 0.498, 0.498], 'LineStyle', ':', 'LineWidth', 1.5);
        end

        % Use fixed model's TeX names for subplot titles (vars required in both models).
        idx_fixed = find(strcmp(var_name, endo_fixed), 1);
        title_lines = Baseline_fixed_nc.M_.endo_names_tex{idx_fixed};
        toTitle = char(deblank(['$', title_lines, '$']));
        title(ax, toTitle, 'Interpreter', 'latex', 'FontSize', 12);
        
        % only for bottom-row plots, add X-axis label "Quarters"
        % Determine tile position and add xlabel only for tiles in the bottom row
        % Get linear index of current tile (var) and layout dims
        nrows = dims(1);
        ncols = dims(2);
        row = ceil(var / ncols);
        if row == nrows
            xlabel(ax, 'Quarters', 'Interpreter', 'latex', 'FontSize', 12);
        end
        xlabel(ax, 'Quarters', 'Interpreter', 'latex', 'FontSize', 12);
    end

    hl = legend(leg_cel, 'NumColumns', 2, 'FontSize', 20, 'Interpreter', 'latex');
    hl.Layout.Tile = 'south';

    graph_name = strjoin(cellfun(@(s) s.M_.fname, models, 'UniformOutput', false), '_');
    % Save PNG at high resolution (set DPI)
    dpi = 600; % desired resolution in dots per inch    
    % option 1:
    % exportgraphics(gcf, [graph_name, '_' , shockName, '_19_3_2026.png'], 'Resolution', dpi);  
    % option 2:
    % If a raster format via print is preferred:    
    print(gcf, [graph_name, '_' , shockName, '_19_3_2026.png'], '-dpng', ['-r', num2str(dpi)]);
end

