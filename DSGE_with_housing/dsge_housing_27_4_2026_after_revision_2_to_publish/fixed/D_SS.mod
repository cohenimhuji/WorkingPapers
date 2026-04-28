
%**************Model with housing************************
% Dynare Steady state file
steady_state_model;

    R=1/p_beta; %gross real interest rate
    spread=p_spread;
    RL=R+spread;
    beta_ratio=p_beta_tag/p_beta;
    ltv=p_ltv;
    shock_spread=0;
    shock_A= A_bar;
	shock_j = j_bar ;
	shock_j_tag = j_bar;
    shock_z=1;
    shock_z_tag=1;
    shock_ltv=0;
    shock_CB=0;
    r_CB=r_CB_star;
    Lagrang_PROD=(eps_c_SS-1)/eps_c_SS;
    eps_c=eps_c_SS;
    eps_r=eps_r_SS;
    DP=DP_TARGET;
    DP_r=DP_TARGET;
    SDF=1/R;

    DP_cpi = w_r * DP_r + (1 - w_r) * DP;

	DP_a = (1 + (DP - 1) * 4)*100;
	DP_r_a = ( (DP_r - 1) * 4)*100;
	DP_cpi_a = ( (DP_cpi - 1) * 4)*100;
	r_CB_a =  (r_CB * 4)*100;
	r_a =  (R - 1) * 400;
	

    pm_q_ratio=1-p_beta; %rent to price ratio
	L_pm_q_ratio=100*log(pm_q_ratio);

    r_q_ratio=(1-p_beta)/((eps_r_SS - 1) / eps_r_SS); %rent to price ratio

	q_r_ratio = 1 /r_q_ratio;
	
	mu_tag_lambda_tag = (1 - p_beta_tag * RL) / (1 - p_beta_tag * (1 - ref)*(1- p_ltv_old));

	ho_hr_ratio=((eps_r_SS/(eps_r_SS-1))*(p_gamma/(1-p_gamma)))^eps;

    param_pamma=(1 - p_gamma_tag)/ p_gamma_tag;	

    tetaAlex=1-p_beta_tag+(p_beta_tag-p_beta_tag*p_ltv_old-1)*ltv*mu_tag_lambda_tag;
	
   ho_hr_ratio_tag = (param_pamma* q_r_ratio * tetaAlex ) ^ (-eps);

   kappa= (1/tetaAlex)*shock_j_tag /(1 + param_pamma * (ho_hr_ratio_tag^(teta-1))) ;

   lambdaAlex=p_ltv_old/(ref+p_ltv_old*(1-ref));

   omega=r_q_ratio*(kappa/ho_hr_ratio_tag);

   param_F = ((1-tau) * Gama_cost)/(1+lambdaAlex*(RL-1)*ltv*kappa+omega);

    N_tag= (((1 - tau) * Gama_cost) / param_F) ^ (1 / (1 + nu));

    N = (((1 / Gama_cost) - (1 - tau) / (N_tag^(1+nu))) / (tau))^-(1/(1 + nu));


    Y=(N^tau)*(N_tag^(1-tau));


    C_tag=param_F*Y; 

    C=Y-C_tag; %consumption of unconstrained households

    lambda=1/C;

    lambda_tag=1/C_tag;

    w=tau*((eps_c_SS-1)/eps_c_SS)*Y/N;

    w_tag=(1-tau)*((eps_c_SS-1)/eps_c_SS)*Y/N_tag;

	q_h_o_tag = kappa * C_tag;

    B_tag =  lambdaAlex*ltv*q_h_o_tag; 
	
    B_tag_n = B_tag * ref; 

    RDIV_b=B_tag*(RL-R);

    lagr_mu=(1/C_tag)*mu_tag_lambda_tag;
	
    B=-B_tag;  

   param_pamma_l=(1 - p_gamma)/ p_gamma;	

   s_l = (1 / (1 - p_beta )) * (shock_j / (1 +  param_pamma_l *(ho_hr_ratio^(teta-1))));
		
   q_hr_c = s_l/ ho_hr_ratio;

  ro_l= s_l/ ho_hr_ratio;
  ro_b = kappa /ho_hr_ratio_tag;


   xi_lb=(ro_l/ro_b)*(C/C_tag); %usefull parameter

    h_r_tag=h/(1+xi_lb+ho_hr_ratio*xi_lb+ho_hr_ratio_tag); %rent of constrained
    h_r=(xi_lb*h)/(1+xi_lb+ho_hr_ratio*xi_lb+ho_hr_ratio_tag); %rent of unconstrained
    h_o=(ho_hr_ratio*xi_lb*h)/(1+xi_lb+ho_hr_ratio*xi_lb+ho_hr_ratio_tag);%ownership of unconstrained
    h_o_tag=(ho_hr_ratio_tag*h)/(1+xi_lb+ho_hr_ratio*xi_lb+ho_hr_ratio_tag); %ownership of constrained

  	q=s_l*C/h_o; %home price

  r= ((1 - p_beta) / ((eps_r_SS - 1) / (eps_r_SS))) * q; %rent price

   p_m = r*(((eps_r - 1) / eps_r));

   h_inv=h_r+h_r_tag;

    RDIV=Y-w*N-w_tag*N_tag-(xi_cost/2)*(((DP/(DP_TARGET^(1-inert_DP)*DP^inert_DP)-1))^2)*Y;

    RDIV_r= h_inv*(r - p_m)-(xi_cost_r/2)*(((DP_r - (DP_TARGET^(1-inert_DP))*DP_r^inert_DP))^2)*r*h_inv;

   p_m_r_ratio = p_m/r;

    ratio_ho_hr=ho_hr_ratio;
    ratio_ho_hr_tag=ho_hr_ratio_tag;

    LC=100*log(C);
    LY=100*log(Y);
    DLY=0;
    LC_tag=100*log(C_tag);
    Lh_o=100*log(h_o);
    Lh_o_tag=100*log(h_o_tag);
    Lh_r=100*log(h_r);
    Lh_r_tag=100*log(h_r_tag);
    Lq=100*log(q);
    Lr=100*log(r);
	
	Lrqratio=100*log(r_q_ratio);
	r_q_ratio_a=400*(r_q_ratio);


    LB_tag=100*log(B_tag);
    LB_tag_n=100*log(B_tag_n);
    LR=(R-1)*100;

	
    r_h_r_tag = r * h_r_tag;
    Debt_delta = 0;
    w_N = w * N;
    w_N_tag=w_tag*N_tag;

	L_w = 100*log(w);
	L_w_tag = 100*log(w_tag);
	L_N = 100*log(N);
	L_N_tag = 100*log(N_tag);
	L_w_N = 100*log(w_N);
	L_w_N_tag = 100*log(w_N_tag);
	
	L_h_inv = 100*log(h_inv);


    RL_per=RL*100;
    rL_a = (RL-1)*400;

    ratio_hoa_hra = (h_o + h_o_tag) / (h_r + h_r_tag);

    ratio_hra_h = (h_r + h_r_tag) / h;

    ratio_r_h = h_r/(h_o + h_r);
    ratio_r_h_tag = h_r_tag/(h_o_tag + h_r_tag);

adj_costs_r=(xi_cost_r/2)*(((DP_r - (DP_TARGET^(1-inert_DP))*DP_r^inert_DP))^2)*r*h_inv;
adj_costs=(xi_cost/2)*(((DP-(DP_TARGET^(1-inert_DP))*DP^inert_DP))^2)*Y;

	Lp_m=100*log(p_m);

h_tag = h_o_tag + h_r_tag;
h_r_tag_r = h_r_tag * r;
h_o_tag_q = h_o_tag * q;
pm_q_ratio_a=400*(p_m/q);


end; // steady_state_model


model_diagnostics;
steady;