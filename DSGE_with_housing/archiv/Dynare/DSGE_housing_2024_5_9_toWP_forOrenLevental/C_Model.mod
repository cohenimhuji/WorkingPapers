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
