function irfs = irfs_models_d(models, ss, var_list, shock_list, leg_cel, names, dims)
    if ~exist('ss','var')
      ss = 0;
    end
    if ~exist('leg_cel','var')
        leg_cel = cell(1, length(models));
        for i = 1 : length(models)
            leg_cel{i} = strrep(models{i}.M_.fname, '_', ' ')
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
        if length(var_list) <= (dims(1) * (dims(2) - 1));
        dims(2) = dims(2) - 1;
        end
    end
    if ~exist('names','var')
      names = shock_list;
    end

    irfs = cell(length(models), 1);
    %var_list = models{1}.oo_.var_list;
    %exo_names = models{1}.M_.exo_names;
    % Calculate the number of subplots
    %sub_ln_c = ceil(length(var_list)^0.5);
    %sub_ln_w = sub_ln_c;
    %if length(var_list) <= (sub_ln_c * (sub_ln_c -1))
    %    sub_ln_w = sub_ln_w - 1;
    %end

    % Loop and plot
    for shock = 1 : length(shock_list)
        figure(Units="inches",Position=[0 0 16 9]);
        tcl = tiledlayout(dims(1), dims(2));
        %toMainTitle = char(deblank(['$',shock_list(shock),'$'])) ;
        %toMainTitle = char(deblank(['$\',shock_list(shock),'$'])) ;
        toMainTitle = shock_list(shock);
        disp(toMainTitle);
        %sgtitle(toMainTitle, interpreter = 'latex');
        for var = 1 : length(var_list)
            %subplot(sub_ln_c, sub_ln_w + 1, var)
            %subplot(sub_ln_c, sub_ln_w, var)
            ax = nexttile(tcl);
            irf_ln = length(models{1}.oo_.irfs.([var_list{var}, ...
                '_', shock_list{shock}]));

            % Create plot Data
            mat_plot = zeros(irf_ln, length(models));
            leg = cell(length(models), 1);
            for model = 1 : length(models)    
              % if exists do something
              if isfield(models{model}.oo_.irfs, ([var_list{var},'_', shock_list{shock}]))
                mat_plot(:, model) = models{model}.oo_.irfs.([var_list{var},'_', shock_list{shock}]) + ss * + models{model}.oo_.steady_state(get_var_ind(var_list{var}));
                leg{model} = models{model}.M_.fname;
              end
            end
            irfs{model}.(shock_list{shock}) = plot(ax,mat_plot);
            
            ytickformat(ax,'%.4g');
            ax.YAxis.Exponent = 0;
            ax.FontName= 'century';%'cmr' ;% defult Latex font
            hold on
            if ss == 0
                plot(ax,zeros(irf_ln, 1),Color=[0.498,0.498,0.498],LineStyle='--',LineWidth=0.2)
            end
            % Latex titles
            title_lines = models{1}.M_.endo_names_tex{get_var_ind(var_list{var})};
            toTitle = char(deblank(['$',char(title_lines),'$'])) ;
            disp(toTitle);
            if length(title_lines) > 17
                %title_lines = title_2(title_lines);
            end
            % title(models{1}.M_.endo_names_tex{get_var_ind(var_list{var})}, ...
            %     Interpreter='latex' , FontSize= 10)
            title(toTitle,Interpreter='latex' , FontSize= 16);
            % title(models{1}.M_.endo_names_tex{get_var_ind(var_list{var})}, ...
            %     Interpreter='latex' , FontSize= 10)
        end
        hl = legend(leg_cel, 'NumColumns', 3, FontSize=20, Interpreter='latex');
        hl.Layout.Tile = 'south';
        %set(gca,'FontSize',20)
        %fig = gcf;
        %fig.Position(1) = fig.Position(1) + 250;

        %subplot(sub_ln_c, sub_ln_w + 1, [(sub_ln_c * sub_ln_w), (sub_ln_c * (sub_ln_w + 1))])
        %plot(zeros(irf_ln, 1), nan)
        %hl = legend('Base scenario', 'Heavy core scenario', 'Light core scenario', ...
        %'NumColumns',3, Location='southoutside');     
        h=gcf;
        exportgraphics(h,[names{shock}, '_', num2str(length(var_list)), '_', num2str(length(models)), '.pdf'])
        exportgraphics(h,[names{shock}, '_', num2str(length(var_list)), '_', num2str(length(models)), '.png'],'Resolution',600)

    end

    %saveas(gcf, [name,'.pdf'])
    % h=gcf;
    % set(h,'PaperOrientation','landscape');
    % set(h,'PaperUnits','normalized');
    % set(h,'PaperPosition', [0 0 1 1]);
    % %print(gcf, '-dpdf', 'test3.pdf');
    % print(h, [name,'.pdf'],'-dpdf','-r0')
end