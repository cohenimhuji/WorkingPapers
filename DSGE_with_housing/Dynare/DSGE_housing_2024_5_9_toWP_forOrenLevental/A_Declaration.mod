%**************Model with housing************************
% Dynare varibels and parameters declaration
var 

shock_spread, spread, RDIV_b, SDF, DLY, shock_A, N, N_tag, w, w_tag,  RDIV, 
Lagrang_PROD, eps_c,  ratio_hra_h,  ratio_r_h ,  ratio_r_h_tag, marg_ut_own, marg_ut_rent,
 adj_costs_r,adj_costs,h, 
Y,
lambda, lambda_tag, C, C_tag, shock_z, shock_z_tag, shock_j, shock_j_tag,
q               $q\ (real\ house\ prices)$ ,
r               $r\ (real\ rent\ prices)$ ,
lagr_mu, 
R               $R\ (real\ IR)$,
 r_CB_a         $ i^{CB}\ (ann.\ pp)$ ,
 spread_a       $ \Delta\ (\%)$ ,
 
 R_a            $ R\ (real\ IR)(ann.\ pp)$,
 B, B_tag, 
r_q_ratio       $r/q$ ,
shock_ltv, shock_CB,
LR, 
dq_exp,
RQ_ratio_aux,
LRQ_ratio_aux,
w_N_tag,
L_w_N_tag       $Con.\ HHs\ Labor\ Income (\%)$,
w_N,
L_w_N           $Uncon.\ HHs\ Labor\ Income (\%)$,

Income_rich     $Uncon.\ HHs\ Income$,
%B_tag_R

Debt_delta     $Debt delta$,
ltv            $LTV$,
r_h_r_tag      $Rent\ payements$,
B_tag_RL       $Interest\ rate\ payements$,
B_tag_RL_GROSS,
LY             $Y\ (\%)$ ,
Lq             $q\ (real\ house\ prices) (\%)$ ,
Lr             $r\ (real\ rent\ prices) (\%)$ ,

Lrqratio       $r/q\ (\%)$ ,
r_q_ratio_a    $r/q\ (ann.\ pp)$ ,

DP	 		$\pi^{exlud\ rent}$ ,
DP_r		$\pi^{rent}$ ,
DP_cpi 		$\pi$ ,
DP_a        $\pi^{exlud \ rent}\ (ann.\ pp)$ ,
DP_r_a      $\pi^{rent}\ (ann.\ pp)$ ,
DP_cpi_a    $\pi\ (ann.\ pp)$ ,
						 
 r_CB           $ i^{CB}$ ,
 RL             $ Risky\ real\ rate$ ,
 RL_per         $ Risky\ real\ rate (\%) $,
 LB_tag         $ B\ (real\ debt) (\%)$ ,
 LC             $ C\ (Uncon.) (\%)$ ,
 LC_tag         $ C^{\prime}\ (Con.) (\%)$ ,
 ratio_ho_hr    $ h^{\prime}_o/h^{\prime}_r\ (Uncon.)$ ,
 ratio_ho_hr_tag $ h^{\prime}_o/h^{\prime}_r\ (Con.)$ ,
 
 
 h_o 		$h_o\ (Uncon.)$,
 h_r 		$h_r\ (Uncon.)$,
 h_o_tag 	$h^{\prime}_o\ (Con.)$,
 h_r_tag 	$h^{\prime}_r\ (Con.)$,
 h_inv          $h_{inv}\ (Uncon.)$,

 Lh_o 		$h_o\ (Uncon.)\ (\%)$,
 Lh_o_tag 	$h^{\prime}_o\ (Con.)\ (\%)$,
 Lh_r 		$h_r\ (Uncon.)\ (\%)$,
 Lh_r_tag 	$h^{\prime}_r\ (Con.)\ (\%)$,
 L_h_inv        $h_{inv} (Uncon.)(\%)$ , 
 
 ratio_hoa_hra  $Ownership/Rent (Total)$,

p_m             $ m.c.\ of\ rented\ house$,
p_m_q_ratio,
p_m_r_ratio,
eps_r,
RDIV_r,


//auxulary variables

leverage_BoY  	$ B / Y $,
leverage_BoWtag $ B / w{\prime}*N{\prime} $,
leverage_PTI	$ PTI $


Lp_m  $r^{*}\ renting\ m.c.\ (\%)$




;
//expend_ho_tag, expend_hr_tag,expend_R_lag_tag, income_ho_lag_tag, total_net_exp_tag, expend_ho, expend_inv,expend_R_lag,
//income_inv_lag, income_ho_lag, total_net_exp, marg_ut_o_tag;

varexo eps_z, eps_z_tag, eps_j, eps_j_tag, eps_ltv, eps_A,
         shock_eps_c, shock_eps_r, eps_h, 
        eps_CB $\eps_{CB}$, eps_spread;

parameters p_r_q_ratio, param_unc_aux1, ro_spread, p_alfa, p_spread, ro_A, ro_eps_c, ro_eps_r, DP_TARGET, xi_cost, xi_cost_r, teta1, teta2, r_CB_star, r_cb_inertia, A_bar, inert_DP, eps_c_SS, eps_r_SS, Gama_cost, Gama_cost_r, Gama_cost_inv, nu, h_c, h_ss, p_beta, p_beta_tag, beta_ratio, p_gamma, p_gamma_tag, p_gamma_au, p_gamma_au_tag,p_ltv, p_gamma_c, p_gamma_c_tag, k, tau, eps, teta,
par_con_aux, par_unc_aux, ro_shock_z, ro_shock_j, ro_shock_ltv, ho_hr_ratio, ho_hr_ratio_tag , ro_shock_CB
w_r, ro_shock_h;