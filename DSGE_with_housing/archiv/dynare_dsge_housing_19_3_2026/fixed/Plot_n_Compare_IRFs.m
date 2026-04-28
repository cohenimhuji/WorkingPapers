Variabels_4_4 = {'LY','DP_cpi_a', 'R_a', 'L_h_inv',...
				'Lh_o',  'Lh_r','LC', 'LB_tag',...
				'Lh_o_tag','Lh_r_tag','LC_tag', 'LB_tag_n', ...
				'DP_r_a', 'Lr', 'Lq', 'r_q_ratio'};

Variabels_4_4 = {'LY','DP_cpi_a', 'r_a', 'rL_a', ... 
                'Lh_o',  'Lh_r','LC', 'L_h_inv', ...
                'Lh_o_tag','Lh_r_tag','LC_tag', 'LB_tag', ...
                'DP_r_a', 'Lr', 'Lq', 'LB_tag_n'};
%				'DP_r_a', 'Lr', 'Lq', 'r_q_ratio'};
%				'DP_r_a', 'Lr', 'Lq', 'r_q_ratio', 'r_CB_a'};
Variabels_Appendix = {'LY','DP_cpi_a', 'r_CB_a', 'Lagrang_PROD',...
				'L_h_inv',  'L_w','L_N', 'L_w_N',...
				'LB_tag','L_w_tag','L_N_tag', 'L_w_N_tag', ...
				'DP_r_a', 'Lp_m', 'Lq', 'r_q_ratio'};
%				'DP_r_a', 'Lr', 'Lq', 'r_q_ratio'};
%				'DP_r_a', 'Lr', 'Lq', 'r_q_ratio', 'r_CB_a'};
% Variabels_check = {'h_tag', 'h_tag_u', 'h_r_tag', 'h_o_tag', ...
%     'h_r_tag_r', 'h_o_tag_q', 'L_w_N_tag', 'N_tag', 'w_tag', 'N', 'Lagrang_PROD'};

% Figure 5
irfs_models_d({Baseline, Scenario_Tight_LTV}, 0, Variabels_4_4, {'eps_CB'},{'Baseline ($\overline{LTV}=66\%$)','Tight LTV ($\overline{LTV}=56\%$)'});
% Figure 7
irfs_models_d({Baseline}, 0, Variabels_4_4, {'eps_ltv'});

% Figure A.1
irfs_models_d({Baseline, Scenario_Eps_2}, 0, Variabels_4_4, {'eps_CB'}, {'$\epsilon = 10$','$\epsilon = 2$'});
% Figure A.2
irfs_models_d({Baseline, Scenario_Eps_2}, 0, Variabels_4_4, {'eps_ltv'}, {'$\epsilon$ = 10$','$\epsilon = 2$'});

% Figure A.3
irfs_models_d({Baseline, Scenario_J_12}, 0, Variabels_4_4, {'eps_CB'}, {'j = 1','j = 0.12'});

% Figure A.4
irfs_models_d({Baseline, Scenario_J_12}, 0, Variabels_4_4, {'eps_ltv'}, {'j = 1','j = 0.12'});

% Figure A.6
% irfs_models_d({Baseline}, 0, Variabels_Appendix, {'eps_CB'});
% 
% % Figure A.7
% irfs_models_d({Baseline}, 0, Variabels_Appendix, {'eps_ltv'});

% irfs_models_d({Baseline, tau_check}, 0, Variabels_4_4, {'eps_CB'});


get_ss('B_tag_n', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)/get_ss('Y', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)
get_ss('B_tag_n', Baseline.M_, Baseline.oo_)/get_ss('Y', Baseline.M_, Baseline.oo_)
get_ss('B_tag_n', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)/get_ss('Y', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)

(get_ss('B_tag_n', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)/get_ss('Y', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)) / ...
(get_ss('B_tag_n', Baseline.M_, Baseline.oo_)/get_ss('Y', Baseline.M_, Baseline.oo_)) 

(get_ss('B_tag_n', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)/get_ss('Y', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)) / ...
(get_ss('B_tag_n', Baseline.M_, Baseline.oo_)/get_ss('Y', Baseline.M_, Baseline.oo_)) 

get_ss('h_r', Baseline.M_, Baseline.oo_) / ...
(get_ss('h_r', Baseline.M_, Baseline.oo_) + get_ss('h_o', Baseline.M_, Baseline.oo_)) 

get_ss('h_r', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_) / ...
(get_ss('h_r', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_) + get_ss('h_o', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)) 

get_ss('h_r', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_) / ...
(get_ss('h_r', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_) + get_ss('h_o', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)) 
    

get_ss('h_r_tag', Baseline.M_, Baseline.oo_) / ...
(get_ss('h_r_tag', Baseline.M_, Baseline.oo_) + get_ss('h_o_tag', Baseline.M_, Baseline.oo_)) 

get_ss('h_r_tag', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_) / ...
(get_ss('h_r_tag', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_) + get_ss('h_o_tag', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_)) 

get_ss('h_r_tag', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_) / ...
(get_ss('h_r_tag', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_) + get_ss('h_o_tag', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_)) 
    

(get_ss('h_r', Baseline.M_, Baseline.oo_) + get_ss('h_r_tag', Baseline.M_, Baseline.oo_))  / ...
100

(get_ss('h_r', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_) + get_ss('h_r_tag', Scenario_Tight_LTV.M_, Scenario_Tight_LTV.oo_))  / ...
100

(get_ss('h_r', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_) + get_ss('h_r_tag', Scenario_tau_Tight_LTV.M_, Scenario_tau_Tight_LTV.oo_))  / ...
100 