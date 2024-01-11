function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = QPMwCredit_24_5_22_nim.static_resid_tt(T, y, x, params);
end
residual = zeros(55, 1);
lhs = y(1);
rhs = y(1)*params(1)+y(1)*(1-params(1))-params(3)*y(9)+x(1);
residual(1) = lhs - rhs;
lhs = y(6);
rhs = x(2)+y(1)*params(5)+(1-params(4))*y(7)+params(4)*y(7);
residual(2) = lhs - rhs;
lhs = y(10);
rhs = x(3)+y(10)*params(6)+(1-params(6))*(y(1)*params(8)+y(5)+y(8)+params(7)*(y(7)-y(8)));
residual(3) = lhs - rhs;
lhs = y(8);
rhs = (1-params(9))*params(10)+y(8)*params(9)+x(4);
residual(4) = lhs - rhs;
lhs = y(5);
rhs = params(49)+params(48)*4*y(3)+x(5);
residual(5) = lhs - rhs;
lhs = y(3);
rhs = (1-params(13))*params(14)+y(3)*params(13)+x(6);
residual(6) = lhs - rhs;
lhs = y(9);
rhs = y(4)-y(5);
residual(7) = lhs - rhs;
lhs = y(7);
rhs = 0.25*(y(6)+y(6)+y(6)+y(6));
residual(8) = lhs - rhs;
lhs = y(4);
rhs = y(10)-y(6);
residual(9) = lhs - rhs;
lhs = y(2);
rhs = y(3);
residual(10) = lhs - rhs;
lhs = y(11);
rhs = y(11)*params(15)+y(11)*(1-params(15))-params(17)*y(20)+params(18)*y(24)+y(1)*params(19)+x(8);
residual(11) = lhs - rhs;
lhs = y(17);
rhs = x(9)+params(25)*y(28)+y(28)*params(24)+params(23)*y(29)+y(11)*params(22)+(1-params(21))*y(18)+params(21)*y(18);
residual(12) = lhs - rhs;
lhs = y(22);
rhs = y(22)*params(41)+y(22)*(1-params(41))-(y(14)-y(4)-y(25))/4;
residual(13) = lhs - rhs;
lhs = y(21);
rhs = x(10)+y(21)*params(26)+(1-params(26))*(y(29)*params(29)+y(11)*params(28)+(1-params(60))*y(15)+params(60)*y(16)+y(19)+params(27)*(0.75*(y(18)-y(19))+0.25*(y(18)-y(19))));
residual(14) = lhs - rhs;
residual(15) = y(37);
lhs = y(38);
rhs = 4*(y(12)-y(13));
residual(16) = lhs - rhs;
lhs = y(19);
rhs = (1-params(30))*params(31)+y(19)*params(30)+x(11);
residual(17) = lhs - rhs;
lhs = y(15);
rhs = params(50)+y(13)*4*params(51)+y(2)*4*params(52)-params(53)*y(32)+x(12);
residual(18) = lhs - rhs;
lhs = y(16);
rhs = params(50)+y(13)*4*params(51)+y(2)*4*params(52)+x(12);
residual(19) = lhs - rhs;
lhs = y(13);
rhs = (1-params(34)-params(46))*params(35)+y(13)*params(34)+y(2)*params(46)-x(13);
residual(20) = lhs - rhs;
lhs = y(25);
rhs = y(15)-y(5)+x(14);
residual(21) = lhs - rhs;
lhs = y(23);
rhs = (1-params(42))*params(43)+y(23)*params(42)+y(30);
residual(22) = lhs - rhs;
lhs = y(30);
rhs = y(30)*params(45)+x(16);
residual(23) = lhs - rhs;
lhs = y(28);
rhs = y(28)*params(36)+x(17);
residual(24) = lhs - rhs;
lhs = y(20);
rhs = y(14)-y(15);
residual(25) = lhs - rhs;
lhs = y(18);
rhs = 0.25*(y(17)+y(17)+y(17)+y(17));
residual(26) = lhs - rhs;
lhs = y(14);
rhs = y(21)-y(17);
residual(27) = lhs - rhs;
lhs = y(24);
rhs = y(22)-y(23);
residual(28) = lhs - rhs;
lhs = y(26);
rhs = (y(17)-y(6))/4;
residual(29) = lhs - rhs;
lhs = y(12);
rhs = y(13);
residual(30) = lhs - rhs;
residual(31) = y(27);
residual(32) = y(29);
lhs = y(32);
rhs = params(55)*y(35)+y(36);
residual(33) = lhs - rhs;
lhs = y(36);
rhs = y(36)*params(56)+x(15);
residual(34) = lhs - rhs;
lhs = y(35);
rhs = y(33)-y(11);
residual(35) = lhs - rhs;
lhs = y(31);
rhs = y(21)+y(32);
residual(36) = lhs - rhs;
lhs = y(33);
rhs = 0.25*(y(31)-(params(31)+params(33)))+1.0075*(y(33)-0.25*(y(17)-params(31))-(y(13)-params(35)))+1.05*(y(34)-y(11));
residual(37) = lhs - rhs;
lhs = y(34);
rhs = params(15)*y(34)+(1-params(15))*y(34)-params(17)*params(20)*(y(31)-params(33)-y(17)+y(35)*params(59)-4*(y(13)-params(35)));
residual(38) = lhs - rhs;
lhs = y(39);
rhs = x(7);
residual(39) = lhs - rhs;
lhs = y(40);
rhs = y(7);
residual(40) = lhs - rhs;
lhs = y(41);
rhs = y(7);
residual(41) = lhs - rhs;
lhs = y(42);
rhs = y(7);
residual(42) = lhs - rhs;
lhs = y(43);
rhs = y(8);
residual(43) = lhs - rhs;
lhs = y(44);
rhs = y(8);
residual(44) = lhs - rhs;
lhs = y(45);
rhs = y(8);
residual(45) = lhs - rhs;
lhs = y(46);
rhs = y(18);
residual(46) = lhs - rhs;
lhs = y(47);
rhs = y(18);
residual(47) = lhs - rhs;
lhs = y(48);
rhs = y(18);
residual(48) = lhs - rhs;
lhs = y(49);
rhs = y(19);
residual(49) = lhs - rhs;
lhs = y(50);
rhs = y(19);
residual(50) = lhs - rhs;
lhs = y(51);
rhs = y(19);
residual(51) = lhs - rhs;
lhs = y(52);
rhs = y(6);
residual(52) = lhs - rhs;
lhs = y(53);
rhs = y(6);
residual(53) = lhs - rhs;
lhs = y(54);
rhs = y(17);
residual(54) = lhs - rhs;
lhs = y(55);
rhs = y(17);
residual(55) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
