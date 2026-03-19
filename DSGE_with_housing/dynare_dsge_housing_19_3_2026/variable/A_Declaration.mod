%**************Model with housing************************
% Dynare varibels and parameters declaration
var 
h_tag, h_tag_u, h_o_tag_q, h_r_tag_r,
shock_spread, spread, RDIV_b, SDF, DLY, shock_A,  RDIV, 
Lagrang_PROD,
eps_c,  ratio_hra_h,  ratio_r_h ,  ratio_r_h_tag, %marg_ut_own, marg_ut_rent,
 adj_costs_r,adj_costs,h, 
Y,
lambda, lambda_tag, C, C_tag, shock_z, shock_z_tag, shock_j, shock_j_tag,
q               $q\ (real\ house\ prices)$ ,
r               $r\ (real\ rent\ prices)$ ,
lagr_mu, 
R               $R\ (real\ IR)$,
 r_CB_a         $ i^{CB}\ (ann.\ pp)$ ,
 spread_a       $ \Delta\ (\%)$ ,
 
 r_a            $ r\ (real\ IR)(ann.\ pp)$,
 B, B_tag, 
r_q_ratio       $r/q$ ,
shock_ltv, shock_CB, shock_ltv_all, shock_ltv_old,
LR, 
dq_exp,
RQ_ratio_aux,
LRQ_ratio_aux,

N 				$N\ (Uncon.)$,
L_N 				$N\ (Uncon.)(\%)$,
N_tag			$N^{\prime}\ (Con.)$,
L_N_tag			$N^{\prime}\ (Con.)(\%)$,
w				$w (Uncon.)$, 
L_w				$w (Uncon.)(\%)$, 
w_tag			$w^{\prime}(Con.)$,
L_w_tag			$w^{\prime}(Con.)(\%)$,

w_N_tag			$w^{\prime}\cdot N^{\prime}\ (Con.)$,
L_w_N_tag       $w^{\prime}\cdot N^{\prime}\ (Con.) (\%)$,
w_N				$w\cdot N\ (Uncon.) $,
L_w_N           $w\cdot N\ (Uncon.)(\%)$,

Income_rich     $Uncon.\ HHs\ Income$,
Income_poor     $Con.\ HHs\ Income$,
%B_tag_R

Debt_delta     $Debt delta$,
ltv            $LTV$,
%ltv_all            $LTV_all$,
ltv_old            $LTV_old$,
r_h_r_tag      $Rent\ payements$,
B_tag_RL       $Interest\ rate\ payements$,
B_tag_RL_GROSS,
LY             	$Y\ (\%)$ ,
Lq             	$q\ (real\ house\ prices) (\%)$ ,
Lr             	$r\ (real\ rent\ prices) (\%)$ ,

Lrqratio       	$r/q\ (\%)$ ,
r_q_ratio_a    	$r/q\ (ann.\ pp)$ ,

DP	 			$\pi^{exlud\ rent}$ ,
DP_r			$\pi^{rent}$,
DP_cpi 			$\pi$ ,
DP_a       		$\pi^{exlud \ rent}\ (ann.\ pp)$ ,
DP_r_a     		$\pi^{rent}\ (ann.\ pp)$ ,
DP_cpi_a    	$\pi\ (ann.\ pp)$ ,
						 
 r_CB           $ i^{CB}$ ,
 RL             $ mortg.\ real\ IR$ ,
 RL_per         $ mortg.\ real\ IR\ (\%) $,
 rL_a           $ mortg.\ real\ IR\ (ann.\ pp)$,

 LB_tag         $ B\ (stock\ of\ debt) (\%)$ ,
 LB_tag_n         $ B\ (new\ debt) (\%)$ ,
 LC             $ C\ (Uncon.) (\%)$ ,
 LC_tag         $ C^{\prime}\ (Con.) (\%)$ ,
 ratio_ho_hr    $ h^{\prime}_o/h^{\prime}_r\ (Uncon.)$ ,
 ratio_ho_hr_tag $ h^{\prime}_o/h^{\prime}_r\ (Con.)$ ,
 
 
 h_o 			$h_o\ (Uncon.)$,
 h_r 			$h_r\ (Uncon.)$,
 h_o_tag 		$h^{\prime}_o\ (Con.)$,
 h_r_tag 		$h^{\prime}_r\ (Con.)$,
 h_inv          $h_{inv}\ (Uncon.)$,

 Lh_o 			$h_o\ (Uncon.)\ (\%)$,
 Lh_o_tag 		$h^{\prime}_o\ (Con.)\ (\%)$,
 Lh_r 			$h_r\ (Uncon.)\ (\%)$,
 Lh_r_tag 		$h^{\prime}_r\ (Con.)\ (\%)$,
 L_h_inv        $h_{inv} (Uncon.)(\%)$ , 
 
 ratio_hoa_hra  $Ownership/Rent (Total)$,

p_m             $ r^* m.c.\ of\ rented\ house$,
pm_q_ratio		$ r^*/q$ ,
L_pm_q_ratio 	$ r^*/q\ (\%)$ ,
pm_q_ratio_a  	$ r^*/q\ (ann.\ pp)$ ,
sell_h_tag,
%Lrqratio       	$r/q\ (\%)$ ,
%r_q_ratio_a    	$r/q\ (ann.\ pp)$ ,

p_m_r_ratio,
eps_r,
RDIV_r,
shock_h,


//auxulary variables

leverage_BoY  	$ B / Y $,
leverage_BoWtag $ B / w{\prime}*N{\prime} $,
leverage_PTI	$ PTI $


Lp_m  			$r^{*}\ m.c.\ of\ rented\ house (\%)$


B_tag_n         % New debt


;
//expend_ho_tag, expend_hr_tag,expend_R_lag_tag, income_ho_lag_tag, total_net_exp_tag, expend_ho, expend_inv,expend_R_lag,
//income_inv_lag, income_ho_lag, total_net_exp, marg_ut_o_tag;

varexo eps_z, eps_z_tag, eps_j, eps_j_tag, eps_ltv, eps_A,
         shock_eps_c, shock_eps_r, eps_h, 
        eps_CB $\eps_{CB}$, eps_spread
		eps_ltv_all, eps_ltv_old;

parameters p_r_q_ratio, param_unc_aux1, ro_spread, p_alfa, p_spread, ro_A, ro_eps_c, ro_eps_r, DP_TARGET, xi_cost, xi_cost_r, teta1, teta2, r_CB_star, r_cb_inertia, A_bar,j_bar, inert_DP, eps_c_SS, eps_r_SS, Gama_cost, Gama_cost_r, Gama_cost_inv, nu, h_c, h_ss, p_beta, p_beta_tag, beta_ratio, p_gamma, p_gamma_tag, p_gamma_au, p_gamma_au_tag,p_ltv, p_gamma_c, p_gamma_c_tag, k, tau, eps, teta,
par_con_aux, par_unc_aux, ro_shock_z, ro_shock_j, ro_shock_ltv, %ho_hr_ratio, ho_hr_ratio_tag , 
ro_shock_CB, ro_shock_ltv_all, ro_shock_ltv_old
w_r, ro_shock_h,
p_ltv_old
%ltv_old         % ltv of existing assets
ref             % Elasticity of new mortgages to housing Debt
alpha           % The share of young households that buy with regulatory ltv
; % ro_shock_h

