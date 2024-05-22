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
p_ltv   = 0.66 ; // 18.9.23 Nimrod. before it was  0.55; //0.53 , LTV ratio in SS. Based on average LTV from 2011-2023 from Mortage file, sheet 18.
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
%**************Model with housing************************
%**************Model with housing************************
% Dynare model section
model;

//Unconstrained Households
// eq.(15) in the pdf file

 // (1) marginal utility
lambda=p_gamma_c*(shock_z*(1/(C-h_c*C(-1))-p_beta*h_c*shock_z(+1)*(1/(C(+1)-h_c*C))));

//   (2) eq. (20) in the pdf file

shock_j*(p_gamma*h_o^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)))=lambda*q*(1+k)+p_beta*lambda(+1)*q(+1)*(k-1);

marg_ut_own=shock_j*(p_gamma*h_o^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)));

//   (3)  eq. (21) in the pdf file

shock_j*((1-p_gamma)*h_r^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)))=lambda*r;

marg_ut_rent=shock_j*((1-p_gamma)*h_r^(-teta)/(p_gamma*h_o^(1-teta)+(1-p_gamma)*h_r^(1-teta)));


//    (4) eq. (22) in the pdf file

R=lambda/(p_beta*lambda(+1));

//     (5) eq. (23) in the pdf file

N^nu=lambda*w;

//     (6)  eq. (24) in the pdf file

%lambda*(r-q-k*q)=p_beta*lambda(+1)*q(+1)*(k-1);
lambda*(p_m-q-k*q)=p_beta*lambda(+1)*q(+1)*(k-1);


//  (7)
r_q_ratio=r/q;
p_m_q_ratio=p_m/q;


// (8) bugget contstraint


// Rich households
                             
C+q*(h_o+h_inv)+r*h_r+R(-1)*B(-1)=B+q*(h_o(-1)+h_inv(-1))+p_m*h_inv+w*N+RDIV+RDIV_b+RDIV_r;


//Constrained Households

//    (9)  eq. (25) in the pdf file

lambda_tag=p_gamma_c_tag*(shock_z_tag*(1/(C_tag-h_c*C_tag(-1))-p_beta_tag*h_c*shock_z_tag(+1)*(1/(C_tag(+1)-h_c*C_tag))));

//    (10)  eq. (26) in the pdf file

shock_j_tag*(p_gamma_tag*h_o_tag^(-teta)/(p_gamma_tag*h_o_tag^(1-teta)+(1-p_gamma_tag)*h_r_tag^(1-teta)))=lambda_tag*q*(1+k)+p_beta_tag*lambda_tag(+1)*q(+1)*(k-1)-lagr_mu*ltv*q;

//    (11) eq. (27) in the pdf file

shock_j_tag*((1-p_gamma_tag)*h_r_tag^(-teta)/(p_gamma_tag*h_o_tag^(1-teta)+(1-p_gamma_tag)*h_r_tag^(1-teta)))=lambda_tag*r;

//     (12) eq. (28) in the pdf file

lagr_mu=lambda_tag-p_beta_tag*lambda_tag(+1)*RL;

//     (13)  eq. (29) in the pdf file

B_tag=ltv*q*h_o_tag;

//      (14)

N_tag^nu=lambda_tag*w_tag;


//     (14b)
w_N_tag=w_tag*N_tag;

  //       (15)
C_tag+q*h_o_tag+r*h_r_tag+RL(-1)*B_tag(-1)=B_tag+q*h_o_tag(-1)+w_N_tag;


//Firms

//     (17) Eq. (31) in pdf

//Lagrang_PROD=(eps_c-1)/eps_c+(xi_cost/eps_c)*(DP/(DP_TARGET^(1-inert_DP)*DP(-1)^inert_DP)-1)*DP-(p_beta*xi_cost/eps_c)*(DP(+1)/(DP_TARGET^(1-inert_DP)*DP^inert_DP)-1)*DP(+1)*Y(+1)/Y;

Lagrang_PROD=(eps_c-1)/eps_c+(xi_cost/eps_c)*(DP-(DP_TARGET^(1-inert_DP)*DP(-1)^inert_DP))*DP-(SDF*xi_cost/eps_c)*(DP(+1)-(DP_TARGET^(1-inert_DP)*DP^inert_DP))*DP(+1)*Y(+1)/Y;


//    (18) Eq.(32) in pdf

Y=shock_A*(N^tau)*(N_tag^(1-tau));

//   (19)  Eq.(33) in pdf
                             
RDIV=Y- w*N- w_N_tag -(xi_cost/2)*(((DP-(DP_TARGET^(1-inert_DP))*DP(-1)^inert_DP))^2)*Y;

adj_costs=(xi_cost/2)*(((DP-(DP_TARGET^(1-inert_DP))*DP(-1)^inert_DP))^2)*Y;

//    (20) Eq.(34) in pdf
w=Lagrang_PROD*tau*Y/N;

//    (21) Eq.(35) in pdf
w_N_tag=Lagrang_PROD*(1-tau)*Y;

//Rent Firms

p_m_r_ratio=(eps_r-1)/eps_r+(xi_cost_r/eps_r)*(DP_r)*(DP_r - (DP_TARGET^(1-inert_DP))*DP_r(-1)^inert_DP)-(SDF*xi_cost_r/eps_r)*DP_r(+1)*((DP_r(+1) - DP_TARGET^(1-inert_DP)*DP_r^inert_DP));

p_m_r_ratio= p_m/r;

DP_r = (r/r(-1))*DP;

RDIV_r= h_inv*(r - p_m)-(xi_cost_r/2)*(((DP_r - (DP_TARGET^(1-inert_DP))*DP_r(-1)^inert_DP))^2)*r*h_inv;

adj_costs_r=(xi_cost_r/2)*(((DP_r - (DP_TARGET^(1-inert_DP))*DP_r(-1)^inert_DP))^2)*r*h_inv;


//Commercial banks

RL=R+spread;

spread=p_spread+p_alfa*(ltv-p_ltv)+shock_spread;

RDIV_b=B_tag(-1)*(RL(-1)-R(-1));

// (15) shock to maximum LTV

ltv=p_ltv - shock_ltv;



//   (22) CENTRAL BANK
// With CC, r_CB is net (accordingly r_CB_star):
//notice that the CB reacts to output growth (relative to output growth in SS which is zero) rather on output gap.

DP_cpi = w_r * DP_r + (1 - w_r) * DP;

r_CB=r_cb_inertia*r_CB(-1)+(1-r_cb_inertia)*(r_CB_star+teta1*(DP_cpi-DP_TARGET)+teta2*DLY(-1))+shock_CB;//   (23)

R=1+r_CB-DP_cpi(+1)+1;
% R - 1 = r_CB - (DP_cpi(+1)-1);

//Market clearing

B+B_tag=0;

h_inv=h_r+h_r_tag;


h_o+h_o_tag+h_r+h_r_tag =h;

//shock_h=0.6*shock_h(-1)+eps_h;

h = h_ss + eps_h;



// Exogenous PROCESSES

shock_CB=ro_shock_CB*shock_CB(-1)+eps_CB;//shock to prefernce of unconstrsained

log(shock_z)=ro_shock_z*log(shock_z(-1))+eps_z;//shock to prefernce of unconstrsained

log(shock_z_tag)=ro_shock_z*log(shock_z_tag(-1))+0*eps_z+eps_z_tag;  //shock to prefernce of constrsained (0==only id. effect, 1==common effect)

log(shock_j)=ro_shock_j*log(shock_j(-1))+eps_j;  //shock to prefernce of constrsained

log(shock_j_tag)=ro_shock_j*log(shock_j_tag(-1))+0*eps_j+eps_j_tag;  //shock to prefernce of constrsained (0==only id. effect, 1==common effect)

shock_ltv=ro_shock_ltv*shock_ltv(-1)+eps_ltv;

log(eps_c)=log(eps_c_SS)*(1-ro_eps_c)+ro_eps_c*log(eps_c(-1))+shock_eps_c;

log(eps_r)=log(eps_r_SS)*(1-ro_eps_r)+ro_eps_r*log(eps_r(-1))+shock_eps_r;

log(shock_A)=(1-ro_A)*log(A_bar)+ro_A*log(shock_A(-1))+eps_A; //domesic tech shock

shock_spread=ro_spread*shock_spread(-1)+eps_spread;

//auxilary variables

ratio_ho_hr=h_o/h_r;
ratio_ho_hr_tag=h_o_tag/h_r_tag;
SDF*R=1;
LC=100*log(C);
LY=100*log(Y);
DLY=LY-LY(-1); //growth of output
LC_tag=100*log(C_tag);
Lh_o=100*log(h_o);
Lh_o_tag=100*log(h_o_tag);
Lh_r=100*log(h_r);
Lh_r_tag=100*log(h_r_tag);
Lq=100*log(q);
Lr=100*log(r);

Lrqratio=100*log(r_q_ratio);
r_q_ratio_a=400*(r_q_ratio);

LB_tag  = 100*log(B_tag);

LR=(R-1)*100;
Lp_m=100*log(p_m);

leverage_BoY = B_tag / Y ;
leverage_BoWtag  = B_tag / w_N_tag ;
leverage_PTI  =  B_tag * (RL-1) / w_N_tag ;

DP_a = (1 + (DP - 1) * 4)*100;
DP_r_a = (1 + (DP_r - 1) * 4)*100;
DP_cpi_a = (1 + (DP_cpi - 1) * 4)*100;
							  
r_CB_a =  (r_CB * 4)*100;
R_a = (1 + (R - 1) * 4)*100;
spread_a = (spread * 4)*100;


dq_exp=(q(+1)/q-1)*100;

RQ_ratio_aux=1-SDF*q(+1)/q;
LRQ_ratio_aux=log(RQ_ratio_aux)*100;

B_tag_RL = B_tag(-1) * (R(-1)-1);

B_tag_RL_GROSS = B_tag(-1) * (R(-1));

%B_tag_R = B_tag(-1) * (R(-1) - 1);
Debt_delta =  -(B_tag - B_tag(-1));
r_h_r_tag = r * h_r_tag;
w_N = w * N;

Income_rich = B_tag(-1) * (R(-1) -1) + w_N + h_inv * p_m + RDIV + RDIV_b + RDIV_r;

L_w_N = 100*log(w_N);
L_w_N_tag = 100*log(w_N_tag);
L_h_inv = 100*log(h_inv);


RL_per=RL*100;

ratio_hoa_hra = (h_o + h_o_tag) / (h_r + h_r_tag);

ratio_hra_h = (h_r + h_r_tag) / h;

 ratio_r_h = h_r/(h_o + h_r);
 ratio_r_h_tag = h_r_tag/(h_o_tag + h_r_tag);


end;  % Dynare model section


%**************Model with housing************************
% Dynare Steady state file
steady_state_model;

    R=1/p_beta; %gross real interest rate
    spread=p_spread;
    RL=R+spread;
    beta_ratio=p_beta_tag/p_beta;
    ltv=p_ltv;
    shock_spread=0;
    shock_A=1;
    %shock_CB=0;
    shock_z=1;
    shock_z_tag=1;
    shock_j=1;
    shock_j_tag=1;
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
	DP_r_a = (1 + (DP_r - 1) * 4)*100;
	DP_cpi_a = (1 + (DP_cpi - 1) * 4)*100;
	r_CB_a =  (r_CB * 4)*100;
	R_a = (1 + (R - 1) * 4)*100;
	spread_a = (spread * 4)*100;
	

    p_m_q_ratio=(1+k+p_beta*k-p_beta); %rent to price ratio

    r_q_ratio=(1+k+p_beta*k-p_beta)/((eps_r_SS - 1) / eps_r_SS); %rent to price ratio

    ho_hr_ratio=((eps_r_SS/(eps_r_SS-1))*(p_gamma/(1-p_gamma)))^eps;

    ho_hr_ratio_tag=(r_q_ratio/(p_gamma_au_tag*par_con_aux))^(eps); %ownership to rent ratio quantity of constrained eq.46

q_hr_c_tag=(par_con_aux*(1+p_gamma_au_tag*(ho_hr_ratio_tag^(teta-1))))^(-1)/ho_hr_ratio_tag; 


param1_aux=1+((1-p_gamma)/p_gamma)*(ho_hr_ratio^(teta-1)); %usefull parameter

    q_hr_c=(par_unc_aux*param1_aux)^(-1)/ho_hr_ratio; 

q_ho_c_tag=(par_con_aux*(1+p_gamma_au_tag*(ho_hr_ratio_tag^(teta-1))))^(-1);


    param_F=(1-tau)*((eps_c_SS-1)/eps_c_SS)/(1+(RL-1)*ltv*q_ho_c_tag+q_hr_c_tag*r_q_ratio);

    N_tag=((1-tau)*((eps_c_SS-1)/eps_c_SS)/param_F)^(1/(1+nu));

    N=((1/tau)*(Gama_cost_inv-(1-tau)/N_tag^(1+nu)))^(-1/(1+nu));


    Y=(N^tau)*(N_tag^(1-tau));

    C_tag=param_F*Y; 

    C=Y-C_tag; %consumption of unconstrained households

    lambda=1/C;

    lambda_tag=1/C_tag;

    w=tau*((eps_c_SS-1)/eps_c_SS)*Y/N;

    w_tag=(1-tau)*((eps_c_SS-1)/eps_c_SS)*Y/N_tag;

    B_tag=ltv*q_ho_c_tag*C_tag; 

    RDIV_b=B_tag*(RL-R);


    B=-B_tag;  %B includes also B_inv and B

    xi=(q_hr_c/q_hr_c_tag)*(C/C_tag); %usefull parameter
    mu1=ho_hr_ratio; %usefull parameter
    mu2=ho_hr_ratio_tag;%usefull parameter

    h_r_tag=h_ss/(1+xi+mu1*xi+mu2); %rent of constrained
    h_r=xi*h_ss/(1+xi+mu1*xi+mu2); %rent of unconstrained
    h_o=mu1*xi*h_ss/(1+xi+mu1*xi+mu2);%ownership of unconstrained
    h_o_tag=mu2*h_ss/(1+xi+mu1*xi+mu2); %ownership of constrained

    q=q_ho_c_tag*C_tag/h_o_tag; %home price
    r=r_q_ratio*q; %rent price

    p_m = r*(((eps_r - 1) / eps_r));

    lagr_mu=(1/C_tag)*(1-beta_ratio-p_beta_tag*spread); %Lagrangian multiplyer
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

    L_w_N = 100*log(w_N);
    L_w_N_tag=100*log(w_N_tag);
    L_h_inv = 100*log(h_inv);

    RL_per=RL*100;


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


end; // steady_state_model


//model_diagnostics;
steady;
check;
%**************Model with housing************************

shocks;
var eps_z; stderr 0.01;
var eps_z_tag; stderr 0.01;
var eps_j; stderr 0.01;
var eps_j_tag; stderr 0.01;

var eps_ltv; stderr 0.1;
// var eps_ltv; //stderr 0.05;
// periods 0:20 21:500;
// values 0.1, 0;


var eps_A; stderr 0.01;
var shock_eps_c; stderr 0.05;
var shock_eps_r; stderr 0.05;
var eps_CB; stderr 0.0025;
var eps_spread; stderr 0.01/4;

var eps_h; stderr 0.01 ;


end;


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


