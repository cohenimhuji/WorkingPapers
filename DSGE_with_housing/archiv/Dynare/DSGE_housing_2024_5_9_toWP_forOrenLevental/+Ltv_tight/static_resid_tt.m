function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 23);

T(1) = 1/(y(25)-y(25)*params(24))-1/(y(25)-y(25)*params(24))*y(27)*params(24)*params(26);
T(2) = params(29)*y(76)^(-params(39));
T(3) = params(29)*y(76)^(1-params(39))+(1-params(29))*y(77)^(1-params(39));
T(4) = T(2)/T(3);
T(5) = y(29)*T(4);
T(6) = (1-params(29))*y(77)^(-params(39));
T(7) = T(6)/T(3);
T(8) = y(29)*T(7);
T(9) = 1/(y(26)-params(24)*y(26))-1/(y(26)-params(24)*y(26))*y(28)*params(24)*params(27);
T(10) = params(30)*y(78)^(-params(39));
T(11) = params(30)*y(78)^(1-params(39))+(1-params(30))*y(79)^(1-params(39));
T(12) = T(10)/T(11);
T(13) = (1-params(30))*y(79)^(-params(39));
T(14) = T(13)/T(11);
T(15) = params(9)^(1-params(17));
T(16) = y(62)-T(15)*y(62)^params(17);
T(17) = y(7)^params(37);
T(18) = y(8)^(1-params(37));
T(19) = params(10)/2*T(16)^2;
T(20) = y(22)*T(19);
T(21) = y(63)-T(15)*y(63)^params(17);
T(22) = params(11)/2*T(21)^2;
T(23) = y(80)*y(32)*T(22);

end
