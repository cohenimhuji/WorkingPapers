function irfs = irfs_models_d(models, ss, var_list, shock_list, leg_cel, names, dims)
    if ~exist('ss','var')
      ss = 0;
    end
    if ~exist('leg_cel','var')
        leg_cel = cell(1, length(models));
        for i = 1 : length(models)
            leg_cel{i} = strrep(models{i}.M_.fname, '_', ' ');
        end
    end
    if ~exist('shock_list','var')
      shock_list = models{1}.M_.exo_names_tex;
    end
    if ~exist('var_list','var')
      var_list = models{1}.oo_.var_list;
    end
    if ~exist('dims','var')
      dims = [ceil(length(var_list)^0.5), ceil(length(var_list)^0.5)];
        if length(var_list) <= (dims(1) * (dims(2) - 1))
            dims(2) = dims(2) - 1;
        end
    end
    if ~exist('names','var')
      names = shock_list;
    end

    irfs = cell(length(models), 1);

    % Loop over shocks and plot IRFs
    for shock = 1 : length(shock_list)
        % Create new figure for each shock with specified size
        % figure(Units="inches", Position=[0 0 16 9]);
        figure(Units="inches", Position=[0 0 9 9]);

        % Ensure shock name is a char array
        shockName = shock_list{shock};
        % Set the window title (top bar) with the shock name
        set(gcf, 'Name', ['Impulse Response: ', shockName], 'NumberTitle', 'off');
        % Set a global title for the figure that includes the shock name
        sgtitle(['Shock: ', shockName], 'Interpreter', 'latex', 'FontSize', 20);
        
        % Create tiled layout for subplots
        tcl = tiledlayout(dims(1), dims(2));
        tcl.TileSpacing = 'compact';
        tcl.Padding     = 'none';
        %disp(shockName);
        
        % Loop over each variable to plot its IRF
        for var = 1 : length(var_list)
            ax = nexttile(tcl);
            irf_field = [var_list{var}, '_', shock_list{shock}];
            irf_ln = length(models{1}.oo_.irfs.(irf_field));

            % Create plot data matrix: each column for a model
            mat_plot = zeros(irf_ln, length(models));
            leg = cell(length(models), 1);
            for model = 1 : length(models)
              if isfield(models{model}.oo_.irfs, irf_field)
                mat_plot(:, model) = models{model}.oo_.irfs.(irf_field) + ss * models{model}.oo_.steady_state(get_var_ind(var_list{var}));
                leg{model} = models{model}.M_.fname;
              end
            end
            
            % Plot IRFs for the current variable            
            plt = plot(ax, mat_plot, 'LineWidth', 2.5);
            styles = cellstr(get(0, 'DefaultAxesLineStyleOrder'));
            styles = styles(:);
            styles_to_apply = styles(1:numel(plt));         
            colors = get(0, 'DefaultAxesColorOrder');
            colors_to_apply = colors(1:numel(plt), :);
            colors_cell = num2cell(colors_to_apply, 2);
            set(plt, {'LineStyle'}, styles_to_apply, {'Color'}, colors_cell);

            ax.XLim = [1 ax.XLim(2)];
            % Format the axis
            ytickformat(ax, '%.4g');
            ax.YAxis.Exponent = 0;
            ax.FontName = 'century';
            hold(ax, 'on');
            if ss == 0
                plot(ax, zeros(irf_ln, 1), 'Color', [0.498, 0.498, 0.498], 'LineStyle', '--', 'LineWidth', 1.5);
            end
            
            % Set title for each subplot (variable)
            title_lines = models{1}.M_.endo_names_tex{get_var_ind(var_list{var})};
            toTitle = char(deblank(['$', title_lines, '$']));
            %disp(toTitle);
            title(ax, toTitle, 'Interpreter', 'latex', 'FontSize', 12);

            % only for bottom-row plots, add X-axis label "Quarters"
            % Determine tile position and add xlabel only for tiles in the bottom row
            % Get linear index of current tile (v) and layout dims
            nrows = dims(1);
            ncols = dims(2);
            row = ceil(var / ncols);
            if row == nrows
                xlabel(ax, 'Quarters', 'Interpreter', 'latex', 'FontSize', 12);
            end
        end
        
        % Add legend at the bottom of the tiled layout
        hl = legend(leg_cel, 'NumColumns', 3, 'FontSize', 20, 'Interpreter', 'latex');
        hl.Layout.Tile = 'south';
    end
    
    % Save the final figure using the shock name from the names cell array
    graph_name = strjoin(cellfun(@(s) s.M_.fname, models, 'UniformOutput', false), '_');
    % Save PNG at high resolution (set DPI)
    dpi = 600; % desired resolution in dots per inch    
    % option 1:
    % exportgraphics(gcf, [graph_name, '_' , shockName, '_19_3_2026.png'], 'Resolution', dpi);  
    % option 2:
    % If a raster format via print is preferred:        
    print(gcf, [graph_name, '_' , shockName, '_19_3_2026.png'], '-dpng', ['-r', num2str(dpi)]);
end
