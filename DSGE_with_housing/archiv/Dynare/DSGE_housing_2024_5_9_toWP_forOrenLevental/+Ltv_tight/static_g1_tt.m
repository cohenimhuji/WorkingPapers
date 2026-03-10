function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 32);

T = Ltv_tight.static_resid_tt(T, y, x, params);

T(24) = 1-T(15)*getPowerDeriv(y(62),params(17),1);
T(25) = 1-T(15)*getPowerDeriv(y(63),params(17),1);
T(26) = params(29)*getPowerDeriv(y(76),1-params(39),1);
T(27) = y(29)*(T(3)*params(29)*getPowerDeriv(y(76),(-params(39)),1)-T(2)*T(26))/(T(3)*T(3));
T(28) = (1-params(29))*getPowerDeriv(y(77),1-params(39),1);
T(29) = y(29)*(-(T(2)*T(28)))/(T(3)*T(3));
T(30) = y(29)*(T(3)*(1-params(29))*getPowerDeriv(y(77),(-params(39)),1)-T(6)*T(28))/(T(3)*T(3));
T(31) = params(30)*getPowerDeriv(y(78),1-params(39),1);
T(32) = (1-params(30))*getPowerDeriv(y(79),1-params(39),1);

end
