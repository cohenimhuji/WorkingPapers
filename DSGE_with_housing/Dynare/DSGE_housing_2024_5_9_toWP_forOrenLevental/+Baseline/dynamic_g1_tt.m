function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 35);

T = Baseline.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(27) = (-(T(16)*getPowerDeriv(y(18),params(17),1)));
T(28) = (-(T(16)*getPowerDeriv(y(19),params(17),1)));
T(29) = params(29)*getPowerDeriv(y(101),1-params(39),1);
T(30) = y(54)*(T(3)*params(29)*getPowerDeriv(y(101),(-params(39)),1)-T(2)*T(29))/(T(3)*T(3));
T(31) = (1-params(29))*getPowerDeriv(y(102),1-params(39),1);
T(32) = y(54)*(-(T(2)*T(31)))/(T(3)*T(3));
T(33) = y(54)*(T(3)*(1-params(29))*getPowerDeriv(y(102),(-params(39)),1)-T(6)*T(31))/(T(3)*T(3));
T(34) = params(30)*getPowerDeriv(y(103),1-params(39),1);
T(35) = (1-params(30))*getPowerDeriv(y(104),1-params(39),1);

end
