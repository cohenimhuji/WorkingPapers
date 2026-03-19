
%**************Model with housing************************
% Dynare Steady state file
steady_state_model;

    R=1/p_beta; %gross real interest rate
    spread=p_spread;
    RL=R+spread;
    beta_ratio=p_beta_tag/p_beta;
    ltv=p_ltv;
    ltv_old=p_ltv_old;
    shock_spread=0;
    shock_A= A_bar;
	shock_j = j_bar ;
	shock_j_tag = j_bar;
    %shock_CB=0;
    shock_z=1;
    shock_z_tag=1;
    shock_ltv=0;
    shock_ltv_old=0;
    shock_ltv_all=0;
    shock_CB=0;
    shock_h=0;
    r_CB=r_CB_star;
    Lagrang_PROD=(eps_c_SS-1)/eps_c_SS;
    eps_c=eps_c_SS;
    eps_r=eps_r_SS;
    DP=DP_TARGET;
    DP_r=DP_TARGET;
    SDF=1/R;

    DP_cpi = w_r * DP_r + (1 - w_r) * DP;

	DP_a = (1 + (DP - 1) * 4)*100;
	DP_r_a =  (DP_r - 1) * 400;
	DP_cpi_a = (DP_cpi - 1) * 400;
	r_CB_a =  r_CB * 400;
	r_a = (R - 1) * 400;
	spread_a = (spread * 4)*100;
	

    pm_q_ratio=(1+k+p_beta*k-p_beta); %rent to price ratio
	L_pm_q_ratio=100*log(pm_q_ratio);
	pm_q_ratio_a=400*(pm_q_ratio);

    r_q_ratio=(1+k+p_beta*k-p_beta)/((eps_r_SS - 1) / eps_r_SS); %rent to price ratio

	q_r_ratio = 1 / r_q_ratio;
	
	%mu_tag_lambda_tag = (1 - p_beta_tag * RL) / (1 - p_beta_tag * (1 - ref) * (1 - ltv_old));
	mu_tag_lambda_tag = (1 - p_beta_tag * RL) / (1 - p_beta_tag * (1 - ref - ltv_old * (1 - alpha)));

	
    ho_hr_ratio=((eps_r_SS/(eps_r_SS-1))*(p_gamma/(1-p_gamma)))^eps;
	
	% check exponent
	%ho_hr_ratio_tag = (((1 - p_gamma_tag) / p_gamma_tag) * q_r_ratio * (1 + k - p_beta_tag * (1 - k) - mu_tag_lambda_tag * ltv + p_beta_tag * mu_tag_lambda_tag * (ltv - ltv_old) )) ^ (-eps); 
	ho_hr_ratio_tag = (((1 - p_gamma_tag) / p_gamma_tag) * q_r_ratio * (1 + k - p_beta_tag * (1 - k) - mu_tag_lambda_tag * ltv * (1 + p_beta_tag * (1 - alpha) * (ltv_old - 1)))) ^ (-eps); 
	
	%kappa = 1 / (1 + k - p_beta_tag * (1 - k) - ((1 - p_beta_tag * RL) / (1 - p_beta_tag * (1 - ref) * (1 - ltv_old))) * (ltv - p_beta_tag * (ltv - ltv_old))) * (shock_j_tag / (1 + ((1 - p_gamma_tag) / p_gamma_tag) * (1 / ho_hr_ratio_tag)^(1 - teta)));
	kappa = 1 / (1 + k - p_beta_tag * (1 - k) - ((1 - p_beta_tag * RL) / (1 - p_beta_tag * (1 - ref - ltv_old * (1 - alpha)))) * ltv * (1 + p_beta_tag * (1 - alpha) * (ltv_old - 1))) * (shock_j_tag / (1 + ((1 - p_gamma_tag) / p_gamma_tag) * (1 / ho_hr_ratio_tag)^(1 - teta)));
	
	%param_F = ((1-tau) * Gama_cost) / (1 + ltv_old * (RL - 1) * (kappa / (ref + ltv_old * (1 - ref))) + (kappa / ho_hr_ratio_tag) * r_q_ratio);
	param_F = ((1-tau) * Gama_cost) / (1 + ltv * (RL - 1) * (kappa * ((alpha + (1 - alpha) * ltv_old) / (ref + (1 - alpha) * ltv_old))) + (kappa / ho_hr_ratio_tag) * r_q_ratio);

    %N_tag=((1-tau)*((eps_c_SS-1)/eps_c_SS)/param_F)^(1/(1+nu));
    N_tag= (((1 - tau) * Gama_cost) / param_F) ^ (1 / (1 + nu));

    %N=((1/tau)*(Gama_cost_inv-(1-tau)/N_tag^(1+nu)))^(-1/(1+nu));
    N = (((1 / Gama_cost) - (1 - tau) / (N_tag^(1+nu))) / (tau))^-(1/(1 + nu));


    Y=(N^tau)*(N_tag^(1-tau));


    %ho_hr_ratio_tag=(r_q_ratio/(p_gamma_au_tag*par_con_aux))^(eps); %ownership to rent ratio quantity of constrained eq.46

%q_hr_c_tag=j_bar*(par_con_aux*(1+p_gamma_au_tag*(ho_hr_ratio_tag^(teta-1))))^(-1)/ho_hr_ratio_tag; 


%param1_aux=1+((1-p_gamma)/p_gamma)*(ho_hr_ratio^(teta-1)); %usefull parameter

    %q_hr_c=j_bar*(par_unc_aux*param1_aux)^(-1)/ho_hr_ratio; 

%q_ho_c_tag=j_bar*(par_con_aux*(1+p_gamma_au_tag*(ho_hr_ratio_tag^(teta-1))))^(-1);




    C_tag=param_F*Y; 

    C=Y-C_tag; %consumption of unconstrained households

    lambda=1/C;

    lambda_tag=1/C_tag;

    w=tau*((eps_c_SS-1)/eps_c_SS)*Y/N;

    w_tag=(1-tau)*((eps_c_SS-1)/eps_c_SS)*Y/N_tag;

    %B_tag = ltv*q_ho_c_tag*C_tag; 
	q_h_o_tag = kappa * C_tag;
    %B_tag = ltv_old * (q_h_o_tag / (ref + ltv_old * (1 - ref))); 
    B_tag = ltv * q_h_o_tag * ((alpha + (1 - alpha) * ltv_old) / (ref + (1 - alpha) * ltv_old)); 
	
    B_tag_n = B_tag * ref; 

    RDIV_b=B_tag*(RL-R);

	%lagr_mu=(1/C_tag)*(1-beta_ratio-p_beta_tag*spread); %Lagrangian multiplyer
	%lagr_mu=((1/C_tag)*(1-p_beta_tag * RL)) / (1 - p_beta_tag * (1 - ref) * (1 - ltv_old))	 ; %Lagrangian multiplyer
	lagr_mu=((1/C_tag)*(1-p_beta_tag * RL)) / (1 - p_beta_tag * (1 - ref - ltv_old * (1 - alpha)))	 ; %Lagrangian multiplyer
	

    B=-B_tag;  %B includes also B_inv and B

	c0 = (1 / (1 + k - p_beta * (1 - k))) * (shock_j / (1 + ((1 - p_gamma) / p_gamma) * (1 / ho_hr_ratio)^(1 - teta)));
	c1 = ho_hr_ratio;
	
	q_hr_c = c0 / c1;
	e1 = c0 / c1;
	e2 = kappa / ho_hr_ratio_tag;
	q_ho_c_tag=j_bar*(par_con_aux*(1+p_gamma_au_tag*(ho_hr_ratio_tag^(teta-1))))^(-1);

	
    %xi=(q_hr_c/q_hr_c_tag)*(C/C_tag); %usefull parameter
    xi=(e1/e2)*(C/C_tag); %usefull parameter
    %mu1=ho_hr_ratio; %usefull parameter
    %mu2=ho_hr_ratio_tag;%usefull parameter

    %h_r_tag=h_ss/(1+xi+mu1*xi+mu2); %rent of constrained
    h_r_tag=h_ss/(1+xi+c1*xi+ho_hr_ratio_tag); %rent of constrained
	%h_r=xi*h_ss/(1+xi+mu1*xi+mu2); %rent of unconstrained
    h_r=(xi*h_ss)/(1+xi+c1*xi+ho_hr_ratio_tag); %rent of unconstrained
	%h_o=mu1*xi*h_ss/(1+xi+mu1*xi+mu2);%ownership of unconstrained
    h_o=(c1*xi*h_ss)/(1+xi+c1*xi+ho_hr_ratio_tag);%ownership of unconstrained
	%h_o_tag=mu2*h_ss/(1+xi+mu1*xi+mu2); %ownership of constrained
    h_o_tag=(ho_hr_ratio_tag*h_ss)/(1+xi+c1*xi+ho_hr_ratio_tag); %ownership of constrained

    
    
    

    %q=q_ho_c_tag*C_tag/h_o_tag; %home price
	q=c0*C/h_o; %home price
    %r=r_q_ratio*q; %rent price
    r= ((1 + k + p_beta * k - p_beta) / ((eps_r_SS - 1) / (eps_r_SS))) * q; %rent price

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
    dq_exp=0;

	
    B_tag_RL = B_tag * (R-1);
    B_tag_RL_GROSS = B_tag * R;
    r_h_r_tag = r * h_r_tag;
    Debt_delta = 0;
    w_N = w * N;
    w_N_tag=w_tag*N_tag;
    Income_rich = B_tag*(R-1) + w_N + h_inv * p_m + RDIV + RDIV_b + RDIV_r;

    RQ_ratio_aux=1-SDF*q/q;
    LRQ_ratio_aux=log(RQ_ratio_aux)*100;

	Income_poor = B_tag_n - (RL - 1 + ref)*B_tag;

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

    ratio_hra_h = (h_r + h_r_tag) / h_ss;

    ratio_r_h = h_r/(h_o + h_r);
    ratio_r_h_tag = h_r_tag/(h_o_tag + h_r_tag);

	
	leverage_BoY = B_tag / Y ;
	leverage_BoWtag  = B_tag / w_N_tag ;
	leverage_PTI  =  B_tag * (RL-1) / w_N_tag ;
marg_ut_rent=shock_j*((1-p_gamma)*h_r^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)));
marg_ut_own=shock_j*(p_gamma*h_o^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)));
h=h_ss ;
adj_costs_r=(xi_cost_r/2)*(((DP_r - (DP_TARGET^(1-inert_DP))*DP_r^inert_DP))^2)*r*h_inv;
adj_costs=(xi_cost/2)*(((DP-(DP_TARGET^(1-inert_DP))*DP^inert_DP))^2)*Y;

	Lp_m=100*log(p_m);

h_tag = h_o_tag + h_r_tag;
h_tag_u = (p_gamma_tag * h_o_tag^((eps - 1) / eps) + (1 - p_gamma_tag) * h_r_tag^((eps - 1) / eps)) ^ ((eps / (eps -1)));
h_r_tag_r = h_r_tag * r;
h_o_tag_q = h_o_tag * q;
end; // steady_state_model


//model_diagnostics;
steady;
check;