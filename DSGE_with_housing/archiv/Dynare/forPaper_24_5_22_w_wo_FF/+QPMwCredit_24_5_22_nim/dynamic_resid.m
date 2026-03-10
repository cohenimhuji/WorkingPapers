function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = QPMwCredit_24_5_22_nim.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(55, 1);
lhs = y(27);
rhs = params(1)*y(82)+(1-params(1))*y(1)-params(3)*y(6)+x(it_, 1);
residual(1) = lhs - rhs;
lhs = y(32);
rhs = x(it_, 2)+y(1)*params(5)+(1-params(4))*y(4)+params(4)*y(99);
residual(2) = lhs - rhs;
lhs = y(36);
rhs = x(it_, 3)+params(6)*y(7)+(1-params(6))*(y(27)*params(8)+y(31)+y(102)+params(7)*(y(99)-y(102)));
residual(3) = lhs - rhs;
lhs = y(34);
rhs = (1-params(9))*params(10)+params(9)*y(5)+x(it_, 4);
residual(4) = lhs - rhs;
lhs = y(31);
rhs = params(49)+params(48)*4*y(84)+x(it_, 5);
residual(5) = lhs - rhs;
lhs = y(29);
rhs = (1-params(13))*params(14)+params(13)*y(2)+x(it_, 6);
residual(6) = lhs - rhs;
lhs = y(35);
rhs = y(30)-y(31);
residual(7) = lhs - rhs;
lhs = y(33);
rhs = 0.25*(y(32)+y(3)+y(23)+y(24));
residual(8) = lhs - rhs;
lhs = y(30);
rhs = y(36)-y(85);
residual(9) = lhs - rhs;
lhs = y(28);
rhs = y(27)+y(29)-y(1);
residual(10) = lhs - rhs;
lhs = y(37);
rhs = params(15)*y(88)+(1-params(15))*y(8)-params(17)*y(13)+params(18)*y(17)+y(27)*params(19)+x(it_, 8);
residual(11) = lhs - rhs;
lhs = y(43);
rhs = x(it_, 9)+params(25)*y(18)+params(24)*y(54)+params(23)*y(55)+y(8)*params(22)+(1-params(21))*y(11)+params(21)*y(105);
residual(12) = lhs - rhs;
lhs = y(48);
rhs = params(41)*y(93)+(1-params(41))*y(15)-(y(40)-y(30)-y(51))/4;
residual(13) = lhs - rhs;
lhs = y(47);
rhs = x(it_, 10)+params(26)*y(14)+(1-params(26))*(y(55)*params(29)+y(37)*params(28)+(1-params(60))*y(41)+params(60)*y(42)+y(108)+params(27)*(0.75*(y(105)-y(108))+0.25*(y(44)-y(108))));
residual(14) = lhs - rhs;
lhs = y(63);
rhs = y(47)-y(14);
residual(15) = lhs - rhs;
lhs = y(64);
rhs = 4*(y(38)-y(39));
residual(16) = lhs - rhs;
lhs = y(45);
rhs = (1-params(30))*params(31)+params(30)*y(12)+x(it_, 11);
residual(17) = lhs - rhs;
lhs = y(41);
rhs = params(50)+4*params(51)*y(89)+4*params(52)*y(83)-params(53)*y(58)-params(54)*(y(96)-y(65))+x(it_, 12);
residual(18) = lhs - rhs;
lhs = y(42);
rhs = params(50)+4*params(51)*y(89)+4*params(52)*y(83)+x(it_, 12);
residual(19) = lhs - rhs;
lhs = y(39);
rhs = (1-params(34)-params(46))*params(35)+params(34)*y(9)+params(47)*(y(49)-y(16))+y(28)*params(46)-x(it_, 13);
residual(20) = lhs - rhs;
lhs = y(51);
rhs = 4*(y(49)-y(94))+y(41)-y(31)+x(it_, 14);
residual(21) = lhs - rhs;
lhs = y(49);
rhs = (1-params(42))*params(43)+y(16)*params(42)+y(56);
residual(22) = lhs - rhs;
lhs = y(56);
rhs = params(45)*y(19)+x(it_, 16);
residual(23) = lhs - rhs;
lhs = y(54);
rhs = y(18)*params(36)+x(it_, 17);
residual(24) = lhs - rhs;
lhs = y(46);
rhs = y(40)-y(41);
residual(25) = lhs - rhs;
lhs = y(44);
rhs = 0.25*(y(43)+y(10)+y(25)+y(26));
residual(26) = lhs - rhs;
lhs = y(40);
rhs = y(47)-y(90);
residual(27) = lhs - rhs;
lhs = y(50);
rhs = y(48)-y(49);
residual(28) = lhs - rhs;
lhs = y(52);
rhs = y(48)-y(15)+(y(43)-y(32))/4;
residual(29) = lhs - rhs;
lhs = y(38);
rhs = y(37)+y(39)-y(8);
residual(30) = lhs - rhs;
residual(31) = y(53);
lhs = y(55);
rhs = y(48)-y(15);
residual(32) = lhs - rhs;
lhs = y(58);
rhs = params(55)*y(61)+y(62);
residual(33) = lhs - rhs;
lhs = y(62);
rhs = params(56)*y(22)+x(it_, 15);
residual(34) = lhs - rhs;
lhs = y(61);
rhs = y(59)-y(37);
residual(35) = lhs - rhs;
lhs = y(57);
rhs = y(47)+y(58);
residual(36) = lhs - rhs;
lhs = y(59);
rhs = 0.25*(y(57)-(params(31)+params(33)))+1.0075*(y(20)-0.25*(y(43)-params(31))-(y(39)-params(35)))+1.05*(y(60)-y(37));
residual(37) = lhs - rhs;
lhs = y(60);
rhs = params(15)*y(95)+(1-params(15))*y(21)-params(17)*params(20)*(y(57)-params(33)-y(90)+y(61)*params(59)-4*(y(89)-params(35)))-(y(96)-y(65));
residual(38) = lhs - rhs;
lhs = y(65);
rhs = x(it_, 7);
residual(39) = lhs - rhs;
lhs = y(66);
rhs = y(86);
residual(40) = lhs - rhs;
lhs = y(67);
rhs = y(97);
residual(41) = lhs - rhs;
lhs = y(68);
rhs = y(98);
residual(42) = lhs - rhs;
lhs = y(69);
rhs = y(87);
residual(43) = lhs - rhs;
lhs = y(70);
rhs = y(100);
residual(44) = lhs - rhs;
lhs = y(71);
rhs = y(101);
residual(45) = lhs - rhs;
lhs = y(72);
rhs = y(91);
residual(46) = lhs - rhs;
lhs = y(73);
rhs = y(103);
residual(47) = lhs - rhs;
lhs = y(74);
rhs = y(104);
residual(48) = lhs - rhs;
lhs = y(75);
rhs = y(92);
residual(49) = lhs - rhs;
lhs = y(76);
rhs = y(106);
residual(50) = lhs - rhs;
lhs = y(77);
rhs = y(107);
residual(51) = lhs - rhs;
lhs = y(78);
rhs = y(3);
residual(52) = lhs - rhs;
lhs = y(79);
rhs = y(23);
residual(53) = lhs - rhs;
lhs = y(80);
rhs = y(10);
residual(54) = lhs - rhs;
lhs = y(81);
rhs = y(25);
residual(55) = lhs - rhs;

end
