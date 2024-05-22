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

