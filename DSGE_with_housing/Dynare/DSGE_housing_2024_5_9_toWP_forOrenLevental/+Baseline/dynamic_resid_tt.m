function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 26);

T(1) = 1/(y(50)-params(24)*y(5))-params(24)*params(26)*y(126)*1/(y(124)-y(50)*params(24));
T(2) = params(29)*y(101)^(-params(39));
T(3) = params(29)*y(101)^(1-params(39))+(1-params(29))*y(102)^(1-params(39));
T(4) = T(2)/T(3);
T(5) = y(54)*T(4);
T(6) = (1-params(29))*y(102)^(-params(39));
T(7) = T(6)/T(3);
T(8) = y(54)*T(7);
T(9) = 1/(y(51)-params(24)*y(6))-params(24)*params(27)*y(127)*1/(y(125)-params(24)*y(51));
T(10) = params(30)*y(103)^(-params(39));
T(11) = params(30)*y(103)^(1-params(39))+(1-params(30))*y(104)^(1-params(39));
T(12) = T(10)/T(11);
T(13) = (1-params(30))*y(104)^(-params(39));
T(14) = T(13)/T(11);
T(15) = params(10)/y(38);
T(16) = params(9)^(1-params(17));
T(17) = y(87)-T(16)*y(18)^params(17);
T(18) = y(129)-T(16)*y(87)^params(17);
T(19) = y(32)^params(37);
T(20) = y(33)^(1-params(37));
T(21) = params(10)/2*T(17)^2;
T(22) = y(47)*T(21);
T(23) = y(88)-T(16)*y(19)^params(17);
T(24) = y(130)-T(16)*y(88)^params(17);
T(25) = params(11)/2*T(23)^2;
T(26) = y(105)*y(57)*T(25);

end
