
%**************Model with housing************************
% Calibration of the parameters
% Base calibration
% 18.9.2023, Nimrod: just about  50% has high LTV (above 60%). so i update tau and p_ltv and p_gamma_tag.
%					tau eas multplied bu 0.5. ltv is now 67% and not 55%.
% 					moreover. we will change p_gamma_tag to keeep ownership to rent to be 1.6
h_c=0.5; //habit formation in consumption of both types of households, in Ilek and Rozenshroom==0.1, in Moise==0.62
h_ss=100; //total supply of houses in the economy
//must hold in calibration that  beta_ratio+p_beta_tag*p_spread<1
p_beta=0.99; //discount factor of unconstrained households (Ilek and Moise==0.99)
p_beta_tag=0.975; //discount factor of constrained households (needed that beta_tag<beta)
//******Important: should satisfy: p_beta_tag/p_beta+p_beta_tag*p_spread<1 ****************
beta_ratio=p_beta_tag/p_beta;
p_spread=0.015/4; //1.5% in sample average, in annual terms, based on Israeli data of average spread of mortagage (prime payments) interest rate minus BOI rate.  
p_alfa=0.02/4;  //spread LTV relationship in Ilek and Cohen (2023). Division by 4 beucase here the interest rate in quarterly terms
p_gamma_c=(1-h_c)/(1-p_beta*h_c);
p_gamma_c_tag=(1-h_c)/(1-p_beta_tag*h_c);
//parameters p_gamma, p_gamma_tag, eps, were chosen that in SS:'ho_hr_ratio=6' and 'ho_hr_ratio_tag=1.8', as in data.
p_gamma = 0.499214 ; //0.75 weight of ownership of unconstrained in the H (CES) function
p_gamma_tag = 0.605; //0.605; //0.62274; // 18.9.23 Nimrod. was updated to keep ownership to rent ratio 1.6 //0.65, 0.75 weight of ownership of constrained in the H (CES) function
eps=10; //elasticity of substitution betwen rent and ownership
p_gamma_au = (1-p_gamma)/p_gamma; //auxilary ratio
p_gamma_au_tag = (1-p_gamma_tag)/p_gamma_tag; //auxilary ratio
p_ltv   = 0.56 ; // 0.67 ; // 18.9.23 Nimrod. before it was  0.55; //0.53 , LTV ratio in SS. Based on average LTV from 2011-2023 from Mortage file, sheet 18.
k       = 0*(1/3)*1.5/100; //adjustment costs (5% of the value of transaction)
tau     = 1 - (0.312+0*0.037) ; //ratio of unconstrained households in the economy 
teta    = 1/eps; //just definition used for futher purposes

par_unc_aux=1+k+p_beta*(k-1); //usefull parameter
param_unc_aux1=1-beta_ratio-p_beta_tag*p_spread;
par_con_aux=1+k+p_beta_tag*(k-1)-param_unc_aux1*p_ltv; //usefull parameter
eps_c_SS=6; %elasticity of substitution betwen differentied goods ((based on Ilek and Rozenshroom, 2018)). in Moise==4.3
eps_r_SS= 6 ; % To calibrate for 5% markup. eps_r/(eps_r - 1) = 1.05 -> eps_r = 21
Gama_cost=(eps_c_SS-1)/eps_c_SS; %marginal costs of firms in SS
Gama_cost_r=(eps_r_SS-1)/eps_r_SS; %marginal costs of firms in SS
Gama_cost_inv=1/Gama_cost;
nu=2.5; %parameter in the disutility from labor in the utility function (based on Ilek and Rozenshroom, 2018). in Moise==2
inert_DP=0.3 ; %inflation inertia: in Ilek and Rozenshroom==0, in Moise==0.365
%inert_DP_r=0.3 ; %inflation inertia: in Ilek and Rozenshroom==0, in Moise==0.365
xi_cost=95; // (based on Ilek and Rozenshroom, 2018)
xi_cost_r=311; // (based on Ilek and Rozenshroom, 2018) , should be bigger than xi_cost for rent to be more rigid than other goods.
teta1=2; //reaction to inflation gap,  in Ilek and Rozenshroom==1.5, in Moise==2.5
teta2=0.2*0.1; //reaction to output growth  in Ilek and Rozenshroom==0.2, in Moise==0.2
A_bar=1;
r_cb_inertia= 0.75;  //(based on Ilek and Rozenshroom, 2018). In Moise this parameter is 0.81.
DP_TARGET=1+0.02/4; //we are talking about quartely inflation rate. The CB interest rate and output grwoth are in quartely terms.
%DP_TARGET_r=1+0.02/4; //we are talking about quartely inflation rate. The CB interest rate and output grwoth are in quartely terms.
r_CB_star=(1/p_beta)-1+DP_TARGET-1;

ro_shock_z=0.95; //serial correlation of the consumption preferernce shocks  //(based on Ilek and Rozenshroom, 2018)
ro_shock_j=0.95;//serial correlation of the housing preference shocks for housing
ro_shock_ltv=0.9999; ////serial correlation of the LTV shock. High serial correlation means that agents expect that change in leverage will take place for a long time
ro_eps_c=0.7;//(based on Ilek and Rozenshroom, 2018)
ro_eps_r=0.7;//
ro_A=0.97; // (based on Ilek and Rozenshroom, 2018)
ro_spread=0.4; //serial correlation in shock to spread
ro_shock_CB = 0 ;

  p_r_q_ratio=(1+k+p_beta*k-p_beta)/((eps_r_SS - 1) / eps_r_SS); %rent to price ratio

ho_hr_ratio=((eps_r_SS/(eps_r_SS-1))*(p_gamma/(1-p_gamma)))^eps;
ho_hr_ratio_tag=(p_r_q_ratio/(p_gamma_au_tag*par_con_aux))^(eps); %ownership to rent ratio quantity of constrained eq.46

w_r = 0.25; % The weight of rent in the CPI basket