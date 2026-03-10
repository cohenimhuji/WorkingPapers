%@#include "base_calibration.mod" 
%stoch_simul(order=1, periods=0, nograph, IRF=0);
%stoch_simul(nograph, nodisplay, order=1) LY Lq Lr Lr_q_ratio DP_a r_CB RL LB_tag LC LC_tag ratio_ho_hr_tag Lh_o Lh_o_tag Lh_r_tag L_B_tag_RL L_r_h_r_tag L_w_N Debt_delta L_Income_rich L_Income_rich_exdiv L_h_inv;
%stoch_simul(nograph, nodisplay, order=1) m LY Lq Lr Lr_q_ratio DP_a r_CB RL_per LB_tag LC LC_tag L_ratio_ho_hr_tag h_o_tag h_r_tag h_o h_r Lh_o Lh_o_tag Lh_r_tag B_tag_RL B_tag_RL_GROSS L_B_tag_RL r_h_r_tag L_r_h_r_tag L_w_N L_w_N_tag Debt_delta L_Income_rich L_Income_rich_exdiv L_h_inv N N_tag dq_exp;
%stoch_simul(nograph, nodisplay, order=1, pruning, irf_shocks = (eps_CB));

%stoch_simul(nograph, nodisplay, order=1, pruning);
%stoch_simul(nograph, nodisplay, order=1, IRF=20);
stoch_simul(nograph, nodisplay, order=1);
%stoch_simul(nograph, nodisplay, order=1, pruning, irf_shocks = (eps_CB)) LY, r_CB, DP_a, Lq, Lr, DP_a_r, Lr_q_ratio, Lh_o,  Lh_r, L_ratio_ho_hr, Lh_o_tag, Lh_r_tag, L_ratio_ho_hr_tag, L_ratio_hoa_hra, LB_tag, LC, LC_tag, L_B_tag_RL, L_r_h_r_tag, Debt_delta, L_Income_rich;
%stoch_simul(order=1, periods=0, IRF=20);

