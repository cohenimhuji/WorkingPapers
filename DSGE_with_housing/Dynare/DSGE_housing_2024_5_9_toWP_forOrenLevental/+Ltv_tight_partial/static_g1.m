function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
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
%   g1
%

if T_flag
    T = Ltv_tight_partial.static_g1_tt(T, y, x, params);
end
g1 = zeros(95, 95);
g1(1,23)=1;
g1(1,25)=(-(params(34)*y(27)*((-(1-params(24)))/((y(25)-y(25)*params(24))*(y(25)-y(25)*params(24)))-y(27)*params(24)*params(26)*(-(1-params(24)))/((y(25)-y(25)*params(24))*(y(25)-y(25)*params(24))))));
g1(1,27)=(-(params(34)*(T(1)+y(27)*(-(1/(y(25)-y(25)*params(24))*params(24)*params(26))))));
g1(2,23)=(-(y(31)*(1+params(36))+(params(36)-1)*params(26)*y(31)));
g1(2,29)=T(4);
g1(2,31)=(-(y(23)*(1+params(36))+y(23)*params(26)*(params(36)-1)));
g1(2,76)=T(27);
g1(2,77)=T(29);
g1(3,17)=1;
g1(3,29)=(-T(4));
g1(3,76)=(-T(27));
g1(3,77)=(-T(29));
g1(4,23)=(-y(32));
g1(4,29)=T(7);
g1(4,32)=(-y(23));
g1(4,76)=y(29)*(-(T(6)*T(26)))/(T(3)*T(3));
g1(4,77)=T(30);
g1(5,18)=1;
g1(5,29)=(-T(7));
g1(5,76)=(-(y(29)*(-(T(6)*T(26)))/(T(3)*T(3))));
g1(5,77)=(-T(30));
g1(6,34)=1;
g1(7,7)=getPowerDeriv(y(7),params(23),1);
g1(7,9)=(-y(23));
g1(7,23)=(-y(9));
g1(8,23)=y(87)-y(31)-y(31)*params(36)-(params(36)-1)*params(26)*y(31);
g1(8,31)=y(23)*((-1)-params(36))-y(23)*params(26)*(params(36)-1);
g1(8,87)=y(23);
g1(9,31)=(-((-y(32))/(y(31)*y(31))));
g1(9,32)=(-(1/y(31)));
g1(9,40)=1;
g1(10,31)=(-((-y(87))/(y(31)*y(31))));
g1(10,87)=(-(1/y(31)));
g1(10,88)=1;
g1(11,3)=(-1);
g1(11,7)=(-y(9));
g1(11,9)=(-y(7));
g1(11,11)=(-1);
g1(11,25)=1;
g1(11,32)=y(77);
g1(11,34)=y(38);
g1(11,38)=y(34)-1;
g1(11,77)=y(32);
g1(11,80)=y(31)-(y(31)+y(87));
g1(11,87)=(-y(80));
g1(11,91)=(-1);
g1(12,24)=1;
g1(12,26)=(-(params(35)*y(28)*((-(1-params(24)))/((y(26)-params(24)*y(26))*(y(26)-params(24)*y(26)))-y(28)*params(24)*params(27)*(-(1-params(24)))/((y(26)-params(24)*y(26))*(y(26)-params(24)*y(26))))));
g1(12,28)=(-(params(35)*(T(9)+y(28)*(-(1/(y(26)-params(24)*y(26))*params(24)*params(27))))));
g1(13,24)=(-(y(31)*(1+params(36))+(params(36)-1)*y(31)*params(27)));
g1(13,30)=T(12);
g1(13,31)=(-((1+params(36))*y(24)+(params(36)-1)*y(24)*params(27)-y(33)*y(53)));
g1(13,33)=y(31)*y(53);
g1(13,53)=y(31)*y(33);
g1(13,78)=y(30)*(T(11)*params(30)*getPowerDeriv(y(78),(-params(39)),1)-T(10)*T(31))/(T(11)*T(11));
g1(13,79)=y(30)*(-(T(10)*T(32)))/(T(11)*T(11));
g1(14,24)=(-y(32));
g1(14,30)=T(14);
g1(14,32)=(-y(24));
g1(14,78)=y(30)*(-(T(13)*T(31)))/(T(11)*T(11));
g1(14,79)=y(30)*(T(11)*(1-params(30))*getPowerDeriv(y(79),(-params(39)),1)-T(13)*T(32))/(T(11)*T(11));
g1(15,24)=(-(1-params(27)*y(69)));
g1(15,33)=1;
g1(15,69)=y(24)*params(27);
g1(16,31)=(-(y(78)*y(53)));
g1(16,39)=1;
g1(16,53)=(-(y(31)*y(78)));
g1(16,78)=(-(y(31)*y(53)));
g1(17,8)=getPowerDeriv(y(8),params(23),1);
g1(17,10)=(-y(24));
g1(17,24)=(-y(10));
g1(18,8)=(-y(10));
g1(18,10)=(-y(8));
g1(18,47)=1;
g1(19,26)=1;
g1(19,32)=y(79);
g1(19,39)=y(69)-1;
g1(19,47)=(-1);
g1(19,69)=y(39);
g1(19,79)=y(32);
g1(20,4)=y(62)*params(10)/y(13)*T(16);
g1(20,12)=1;
g1(20,13)=(-((y(13)-(y(13)-1))/(y(13)*y(13))+y(62)*T(16)*(-params(10))/(y(13)*y(13))-y(62)*T(16)*(-(params(10)*y(4)))/(y(13)*y(13))));
g1(20,62)=(-(params(10)/y(13)*T(16)+y(62)*params(10)/y(13)*T(24)-(T(16)*params(10)*y(4)/y(13)+y(62)*params(10)*y(4)/y(13)*T(24))));
g1(21,6)=(-(T(17)*T(18)));
g1(21,7)=(-(T(18)*y(6)*getPowerDeriv(y(7),params(37),1)));
g1(21,8)=(-(y(6)*T(17)*getPowerDeriv(y(8),1-params(37),1)));
g1(21,22)=1;
g1(22,7)=y(9);
g1(22,9)=y(7);
g1(22,11)=1;
g1(22,22)=(-(1-T(19)));
g1(22,47)=1;
g1(22,62)=y(22)*params(10)/2*T(24)*2*T(16);
g1(23,20)=1;
g1(23,22)=(-T(19));
g1(23,62)=(-(y(22)*params(10)/2*T(24)*2*T(16)));
g1(24,7)=(-((-(y(22)*y(12)*params(37)))/(y(7)*y(7))));
g1(24,9)=1;
g1(24,12)=(-(y(22)*params(37)/y(7)));
g1(24,22)=(-(y(12)*params(37)/y(7)));
g1(25,12)=(-(y(22)*(1-params(37))));
g1(25,22)=(-(y(12)*(1-params(37))));
g1(25,47)=1;
g1(26,4)=params(11)/y(90)*y(63)*T(21);
g1(26,63)=(-(params(11)/y(90)*T(21)+params(11)/y(90)*y(63)*T(25)-(y(63)*y(4)*params(11)/y(90)*T(25)+T(21)*y(4)*params(11)/y(90))));
g1(26,89)=1;
g1(26,90)=(-((y(90)-(y(90)-1))/(y(90)*y(90))+T(21)*y(63)*(-params(11))/(y(90)*y(90))-T(21)*y(63)*(-(y(4)*params(11)))/(y(90)*y(90))));
g1(27,32)=(-((-y(87))/(y(32)*y(32))));
g1(27,87)=(-(1/y(32)));
g1(27,89)=1;
g1(28,62)=(-1);
g1(28,63)=1;
g1(29,32)=(-(y(80)-y(80)*T(22)));
g1(29,63)=y(80)*y(32)*params(11)/2*T(25)*2*T(21);
g1(29,80)=(-(y(32)-y(87)-y(32)*T(22)));
g1(29,87)=y(80);
g1(29,91)=1;
g1(30,19)=1;
g1(30,32)=(-(y(80)*T(22)));
g1(30,63)=(-(y(80)*y(32)*params(11)/2*T(25)*2*T(21)));
g1(30,80)=(-(y(32)*T(22)));
g1(31,2)=(-1);
g1(31,34)=(-1);
g1(31,69)=1;
g1(32,1)=(-1);
g1(32,2)=1;
g1(32,53)=(-params(4));
g1(33,3)=1;
g1(33,34)=y(39);
g1(33,39)=(-(y(69)-y(34)));
g1(33,69)=(-y(39));
g1(34,41)=1;
g1(34,53)=1;
g1(35,62)=(-(1-params(48)));
g1(35,63)=(-params(48));
g1(35,64)=1;
g1(36,5)=(-((1-params(15))*params(13)));
g1(36,42)=(-1);
g1(36,64)=(-((1-params(15))*params(12)));
g1(36,68)=1-params(15);
g1(37,34)=1;
g1(37,64)=1;
g1(37,68)=(-1);
g1(38,38)=1;
g1(38,39)=1;
g1(39,77)=(-1);
g1(39,79)=(-1);
g1(39,80)=1;
g1(40,21)=(-1);
g1(40,76)=1;
g1(40,77)=1;
g1(40,78)=1;
g1(40,79)=1;
g1(41,21)=1;
g1(42,42)=1-params(47);
g1(43,27)=1/y(27)-params(42)*1/y(27);
g1(44,28)=1/y(28)-params(42)*1/y(28);
g1(45,29)=1/y(29)-params(43)*1/y(29);
g1(46,30)=1/y(30)-params(43)*1/y(30);
g1(47,41)=1-params(44);
g1(48,13)=1/y(13)-params(7)*1/y(13);
g1(49,90)=1/y(90)-params(8)*1/y(90);
g1(50,6)=1/y(6)-params(6)*1/y(6);
g1(51,1)=1-params(3);
g1(52,74)=1;
g1(52,76)=(-(1/y(77)));
g1(52,77)=(-((-y(76))/(y(77)*y(77))));
g1(53,75)=1;
g1(53,78)=(-(1/y(79)));
g1(53,79)=(-((-y(78))/(y(79)*y(79))));
g1(54,4)=y(34);
g1(54,34)=y(4);
g1(55,25)=(-(100*1/y(25)));
g1(55,72)=1;
g1(56,22)=(-(100*1/y(22)));
g1(56,57)=1;
g1(57,5)=1;
g1(58,26)=(-(100*1/y(26)));
g1(58,73)=1;
g1(59,76)=(-(100*1/y(76)));
g1(59,81)=1;
g1(60,78)=(-(100*1/y(78)));
g1(60,82)=1;
g1(61,77)=(-(100*1/y(77)));
g1(61,83)=1;
g1(62,79)=(-(100*1/y(79)));
g1(62,84)=1;
g1(63,31)=(-(100*1/y(31)));
g1(63,58)=1;
g1(64,32)=(-(100*1/y(32)));
g1(64,59)=1;
g1(65,40)=(-(100*1/y(40)));
g1(65,60)=1;
g1(66,40)=(-400);
g1(66,61)=1;
g1(67,39)=(-(100*1/y(39)));
g1(67,71)=1;
g1(68,34)=(-100);
g1(68,43)=1;
g1(69,87)=(-(100*1/y(87)));
g1(69,95)=1;
g1(70,22)=(-((-y(39))/(y(22)*y(22))));
g1(70,39)=(-(1/y(22)));
g1(70,92)=1;
g1(71,39)=(-(1/y(47)));
g1(71,47)=(-((-y(39))/(y(47)*y(47))));
g1(71,93)=1;
g1(72,39)=(-((y(69)-1)/y(47)));
g1(72,47)=(-((-(y(39)*(y(69)-1)))/(y(47)*y(47))));
g1(72,69)=(-(y(39)/y(47)));
g1(72,94)=1;
g1(73,62)=(-400);
g1(73,65)=1;
g1(74,63)=(-400);
g1(74,66)=1;
g1(75,64)=(-400);
g1(75,67)=1;
g1(76,35)=1;
g1(76,68)=(-400);
g1(77,34)=(-400);
g1(77,37)=1;
g1(78,2)=(-400);
g1(78,36)=1;
g1(79,44)=1;
g1(80,4)=1;
g1(80,45)=1;
g1(81,45)=(-(100*1/y(45)));
g1(81,46)=1;
g1(82,34)=(-y(39));
g1(82,39)=(-(y(34)-1));
g1(82,55)=1;
g1(83,34)=(-y(39));
g1(83,39)=(-y(34));
g1(83,56)=1;
g1(84,52)=1;
g1(85,32)=(-y(79));
g1(85,54)=1;
g1(85,79)=(-y(32));
g1(86,7)=(-y(9));
g1(86,9)=(-y(7));
g1(86,49)=1;
g1(87,3)=(-1);
g1(87,11)=(-1);
g1(87,34)=(-y(39));
g1(87,39)=(-(y(34)-1));
g1(87,49)=(-1);
g1(87,51)=1;
g1(87,80)=(-y(87));
g1(87,87)=(-y(80));
g1(87,91)=(-1);
g1(88,49)=(-(100*1/y(49)));
g1(88,50)=1;
g1(89,47)=(-(100*1/y(47)));
g1(89,48)=1;
g1(90,80)=(-(100*1/y(80)));
g1(90,85)=1;
g1(91,69)=(-100);
g1(91,70)=1;
g1(92,76)=(-(1/(y(77)+y(79))));
g1(92,77)=(-((-(y(76)+y(78)))/((y(77)+y(79))*(y(77)+y(79)))));
g1(92,78)=(-(1/(y(77)+y(79))));
g1(92,79)=(-((-(y(76)+y(78)))/((y(77)+y(79))*(y(77)+y(79)))));
g1(92,86)=1;
g1(93,14)=1;
g1(93,21)=(-((-(y(77)+y(79)))/(y(21)*y(21))));
g1(93,77)=(-(1/y(21)));
g1(93,79)=(-(1/y(21)));
g1(94,15)=1;
g1(94,76)=(-((-y(77))/((y(76)+y(77))*(y(76)+y(77)))));
g1(94,77)=(-(y(76)/((y(76)+y(77))*(y(76)+y(77)))));
g1(95,16)=1;
g1(95,78)=(-((-y(79))/((y(78)+y(79))*(y(78)+y(79)))));
g1(95,79)=(-(y(78)/((y(78)+y(79))*(y(78)+y(79)))));

end
