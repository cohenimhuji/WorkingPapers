function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = Ltv_tight_partial.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(95, 142);
g1(1,48)=1;
g1(1,5)=(-(params(34)*y(52)*params(24)/((y(50)-params(24)*y(5))*(y(50)-params(24)*y(5)))));
g1(1,50)=(-(params(34)*y(52)*((-1)/((y(50)-params(24)*y(5))*(y(50)-params(24)*y(5)))-params(24)*params(26)*y(126)*params(24)/((y(124)-y(50)*params(24))*(y(124)-y(50)*params(24))))));
g1(1,124)=(-(params(34)*y(52)*(-(params(24)*params(26)*y(126)*(-1)/((y(124)-y(50)*params(24))*(y(124)-y(50)*params(24)))))));
g1(1,52)=(-(params(34)*T(1)));
g1(1,126)=(-(params(34)*y(52)*(-(params(24)*params(26)*1/(y(124)-y(50)*params(24))))));
g1(2,48)=(-(y(56)*(1+params(36))));
g1(2,122)=(-((params(36)-1)*params(26)*y(128)));
g1(2,54)=T(4);
g1(2,56)=(-(y(48)*(1+params(36))));
g1(2,128)=(-(params(26)*y(122)*(params(36)-1)));
g1(2,101)=T(30);
g1(2,102)=T(32);
g1(3,42)=1;
g1(3,54)=(-T(4));
g1(3,101)=(-T(30));
g1(3,102)=(-T(32));
g1(4,48)=(-y(57));
g1(4,54)=T(7);
g1(4,57)=(-y(48));
g1(4,101)=y(54)*(-(T(6)*T(29)))/(T(3)*T(3));
g1(4,102)=T(33);
g1(5,43)=1;
g1(5,54)=(-T(7));
g1(5,101)=(-(y(54)*(-(T(6)*T(29)))/(T(3)*T(3))));
g1(5,102)=(-T(33));
g1(6,48)=(-(1/(params(26)*y(122))));
g1(6,122)=(-((-(y(48)*params(26)))/(params(26)*y(122)*params(26)*y(122))));
g1(6,59)=1;
g1(7,32)=getPowerDeriv(y(32),params(23),1);
g1(7,34)=(-y(48));
g1(7,48)=(-y(34));
g1(8,48)=y(112)-y(56)-y(56)*params(36);
g1(8,122)=(-((params(36)-1)*params(26)*y(128)));
g1(8,56)=y(48)*((-1)-params(36));
g1(8,128)=(-(params(26)*y(122)*(params(36)-1)));
g1(8,112)=y(48);
g1(9,56)=(-((-y(57))/(y(56)*y(56))));
g1(9,57)=(-(1/y(56)));
g1(9,65)=1;
g1(10,56)=(-((-y(112))/(y(56)*y(56))));
g1(10,112)=(-(1/y(56)));
g1(10,113)=1;
g1(11,28)=(-1);
g1(11,32)=(-y(34));
g1(11,34)=(-y(32));
g1(11,36)=(-1);
g1(11,50)=1;
g1(11,56)=y(101)+y(105)-(y(22)+y(24));
g1(11,57)=y(102);
g1(11,12)=y(13);
g1(11,13)=y(12);
g1(11,63)=(-1);
g1(11,22)=(-y(56));
g1(11,101)=y(56);
g1(11,102)=y(57);
g1(11,24)=(-y(56));
g1(11,105)=y(56)-y(112);
g1(11,112)=(-y(105));
g1(11,116)=(-1);
g1(12,49)=1;
g1(12,6)=(-(params(35)*y(53)*params(24)/((y(51)-params(24)*y(6))*(y(51)-params(24)*y(6)))));
g1(12,51)=(-(params(35)*y(53)*((-1)/((y(51)-params(24)*y(6))*(y(51)-params(24)*y(6)))-params(24)*params(27)*y(127)*params(24)/((y(125)-params(24)*y(51))*(y(125)-params(24)*y(51))))));
g1(12,125)=(-(params(35)*y(53)*(-(params(24)*params(27)*y(127)*(-1)/((y(125)-params(24)*y(51))*(y(125)-params(24)*y(51)))))));
g1(12,53)=(-(params(35)*T(9)));
g1(12,127)=(-(params(35)*y(53)*(-(params(24)*params(27)*1/(y(125)-params(24)*y(51))))));
g1(13,49)=(-(y(56)*(1+params(36))));
g1(13,123)=(-((params(36)-1)*y(128)*params(27)));
g1(13,55)=T(12);
g1(13,56)=(-((1+params(36))*y(49)-y(58)*y(78)));
g1(13,128)=(-((params(36)-1)*params(27)*y(123)));
g1(13,58)=y(56)*y(78);
g1(13,78)=y(56)*y(58);
g1(13,103)=y(55)*(T(11)*params(30)*getPowerDeriv(y(103),(-params(39)),1)-T(10)*T(34))/(T(11)*T(11));
g1(13,104)=y(55)*(-(T(10)*T(35)))/(T(11)*T(11));
g1(14,49)=(-y(57));
g1(14,55)=T(14);
g1(14,57)=(-y(49));
g1(14,103)=y(55)*(-(T(13)*T(34)))/(T(11)*T(11));
g1(14,104)=y(55)*(T(11)*(1-params(30))*getPowerDeriv(y(104),(-params(39)),1)-T(13)*T(35))/(T(11)*T(11));
g1(15,49)=(-1);
g1(15,123)=params(27)*y(94);
g1(15,58)=1;
g1(15,94)=params(27)*y(123);
g1(16,56)=(-(y(103)*y(78)));
g1(16,64)=1;
g1(16,78)=(-(y(56)*y(103)));
g1(16,103)=(-(y(56)*y(78)));
g1(17,33)=getPowerDeriv(y(33),params(23),1);
g1(17,35)=(-y(49));
g1(17,49)=(-y(35));
g1(18,33)=(-y(35));
g1(18,35)=(-y(33));
g1(18,72)=1;
g1(19,51)=1;
g1(19,56)=y(103)-y(23);
g1(19,57)=y(104);
g1(19,14)=y(21);
g1(19,64)=(-1);
g1(19,72)=(-1);
g1(19,21)=y(14);
g1(19,23)=(-y(56));
g1(19,103)=y(56);
g1(19,104)=y(57);
g1(20,29)=y(121)*y(129)*T(15)*T(18)/y(47);
g1(20,37)=1;
g1(20,38)=(-((y(38)-(y(38)-1))/(y(38)*y(38))+y(87)*T(17)*(-params(10))/(y(38)*y(38))-y(121)*y(129)*T(18)*(-(params(10)*y(29)))/(y(38)*y(38))/y(47)));
g1(20,47)=(-(y(129)*params(10)*y(29)/y(38)*T(18)*y(121)))/(y(47)*y(47));
g1(20,121)=y(129)*params(10)*y(29)/y(38)*T(18)/y(47);
g1(20,18)=(-(y(87)*T(15)*T(27)));
g1(20,87)=(-(T(15)*T(17)+T(15)*y(87)-y(121)*y(129)*params(10)*y(29)/y(38)*(-(T(16)*getPowerDeriv(y(87),params(17),1)))/y(47)));
g1(20,129)=y(121)*(params(10)*y(29)/y(38)*T(18)+params(10)*y(29)/y(38)*y(129))/y(47);
g1(21,31)=(-(T(19)*T(20)));
g1(21,32)=(-(T(20)*y(31)*getPowerDeriv(y(32),params(37),1)));
g1(21,33)=(-(y(31)*T(19)*getPowerDeriv(y(33),1-params(37),1)));
g1(21,47)=1;
g1(22,32)=y(34);
g1(22,34)=y(32);
g1(22,36)=1;
g1(22,47)=(-(1-T(21)));
g1(22,72)=1;
g1(22,18)=y(47)*params(10)/2*T(27)*2*T(17);
g1(22,87)=y(47)*params(10)/2*2*T(17);
g1(23,45)=1;
g1(23,47)=(-T(21));
g1(23,18)=(-(y(47)*params(10)/2*T(27)*2*T(17)));
g1(23,87)=(-(y(47)*params(10)/2*2*T(17)));
g1(24,32)=(-((-(y(47)*y(37)*params(37)))/(y(32)*y(32))));
g1(24,34)=1;
g1(24,37)=(-(y(47)*params(37)/y(32)));
g1(24,47)=(-(y(37)*params(37)/y(32)));
g1(25,37)=(-(y(47)*(1-params(37))));
g1(25,47)=(-(y(37)*(1-params(37))));
g1(25,72)=1;
g1(26,29)=T(24)*params(11)/y(115)*y(130);
g1(26,19)=(-(params(11)/y(115)*y(88)*T(28)));
g1(26,88)=(-(params(11)/y(115)*y(88)+params(11)/y(115)*T(23)-y(29)*params(11)/y(115)*y(130)*(-(T(16)*getPowerDeriv(y(88),params(17),1)))));
g1(26,130)=y(29)*params(11)/y(115)*y(130)+y(29)*params(11)/y(115)*T(24);
g1(26,114)=1;
g1(26,115)=(-((y(115)-(y(115)-1))/(y(115)*y(115))+T(23)*y(88)*(-params(11))/(y(115)*y(115))-T(24)*y(130)*(-(y(29)*params(11)))/(y(115)*y(115))));
g1(27,57)=(-((-y(112))/(y(57)*y(57))));
g1(27,112)=(-(1/y(57)));
g1(27,114)=1;
g1(28,11)=(-(y(87)*(-y(57))/(y(11)*y(11))));
g1(28,57)=(-(y(87)*1/y(11)));
g1(28,87)=(-(y(57)/y(11)));
g1(28,88)=1;
g1(29,57)=(-(y(105)-y(105)*T(25)));
g1(29,19)=y(105)*y(57)*params(11)/2*T(28)*2*T(23);
g1(29,88)=y(105)*y(57)*params(11)/2*2*T(23);
g1(29,105)=(-(y(57)-y(112)-y(57)*T(25)));
g1(29,112)=y(105);
g1(29,116)=1;
g1(30,44)=1;
g1(30,57)=(-(y(105)*T(25)));
g1(30,19)=(-(y(105)*y(57)*params(11)/2*T(28)*2*T(23)));
g1(30,88)=(-(y(105)*y(57)*params(11)/2*2*T(23)));
g1(30,105)=(-(y(57)*T(25)));
g1(31,27)=(-1);
g1(31,59)=(-1);
g1(31,94)=1;
g1(32,26)=(-1);
g1(32,27)=1;
g1(32,78)=(-params(4));
g1(33,28)=1;
g1(33,12)=y(14);
g1(33,14)=(-(y(21)-y(12)));
g1(33,21)=(-y(14));
g1(34,66)=1;
g1(34,78)=1;
g1(35,87)=(-(1-params(48)));
g1(35,88)=(-params(48));
g1(35,89)=1;
g1(36,2)=(-((1-params(15))*params(13)));
g1(36,67)=(-1);
g1(36,89)=(-((1-params(15))*params(12)));
g1(36,20)=(-params(15));
g1(36,93)=1;
g1(37,59)=1;
g1(37,131)=1;
g1(37,93)=(-1);
g1(38,63)=1;
g1(38,64)=1;
g1(39,102)=(-1);
g1(39,104)=(-1);
g1(39,105)=1;
g1(40,46)=(-1);
g1(40,101)=1;
g1(40,102)=1;
g1(40,103)=1;
g1(40,104)=1;
g1(41,46)=1;
g1(41,140)=(-1);
g1(42,16)=(-params(47));
g1(42,67)=1;
g1(42,141)=(-1);
g1(43,7)=(-(params(42)*1/y(7)));
g1(43,52)=1/y(52);
g1(43,132)=(-1);
g1(44,8)=(-(params(42)*1/y(8)));
g1(44,53)=1/y(53);
g1(44,133)=(-1);
g1(45,9)=(-(params(43)*1/y(9)));
g1(45,54)=1/y(54);
g1(45,134)=(-1);
g1(46,10)=(-(params(43)*1/y(10)));
g1(46,55)=1/y(55);
g1(46,135)=(-1);
g1(47,15)=(-params(44));
g1(47,66)=1;
g1(47,136)=(-1);
g1(48,4)=(-(params(7)*1/y(4)));
g1(48,38)=1/y(38);
g1(48,138)=(-1);
g1(49,25)=(-(params(8)*1/y(25)));
g1(49,115)=1/y(115);
g1(49,139)=(-1);
g1(50,3)=(-(params(6)*1/y(3)));
g1(50,31)=1/y(31);
g1(50,137)=(-1);
g1(51,1)=(-params(3));
g1(51,26)=1;
g1(51,142)=(-1);
g1(52,99)=1;
g1(52,101)=(-(1/y(102)));
g1(52,102)=(-((-y(101))/(y(102)*y(102))));
g1(53,100)=1;
g1(53,103)=(-(1/y(104)));
g1(53,104)=(-((-y(103))/(y(104)*y(104))));
g1(54,29)=y(59);
g1(54,59)=y(29);
g1(55,50)=(-(100*1/y(50)));
g1(55,97)=1;
g1(56,47)=(-(100*1/y(47)));
g1(56,82)=1;
g1(57,30)=1;
g1(57,17)=1;
g1(57,82)=(-1);
g1(58,51)=(-(100*1/y(51)));
g1(58,98)=1;
g1(59,101)=(-(100*1/y(101)));
g1(59,106)=1;
g1(60,103)=(-(100*1/y(103)));
g1(60,107)=1;
g1(61,102)=(-(100*1/y(102)));
g1(61,108)=1;
g1(62,104)=(-(100*1/y(104)));
g1(62,109)=1;
g1(63,56)=(-(100*1/y(56)));
g1(63,83)=1;
g1(64,57)=(-(100*1/y(57)));
g1(64,84)=1;
g1(65,65)=(-(100*1/y(65)));
g1(65,85)=1;
g1(66,65)=(-400);
g1(66,86)=1;
g1(67,64)=(-(100*1/y(64)));
g1(67,96)=1;
g1(68,59)=(-100);
g1(68,68)=1;
g1(69,112)=(-(100*1/y(112)));
g1(69,120)=1;
g1(70,47)=(-((-y(64))/(y(47)*y(47))));
g1(70,64)=(-(1/y(47)));
g1(70,117)=1;
g1(71,64)=(-(1/y(72)));
g1(71,72)=(-((-y(64))/(y(72)*y(72))));
g1(71,118)=1;
g1(72,64)=(-((y(94)-1)/y(72)));
g1(72,72)=(-((-(y(64)*(y(94)-1)))/(y(72)*y(72))));
g1(72,94)=(-(y(64)/y(72)));
g1(72,119)=1;
g1(73,87)=(-400);
g1(73,90)=1;
g1(74,88)=(-400);
g1(74,91)=1;
g1(75,89)=(-400);
g1(75,92)=1;
g1(76,60)=1;
g1(76,93)=(-400);
g1(77,59)=(-400);
g1(77,62)=1;
g1(78,27)=(-400);
g1(78,61)=1;
g1(79,56)=(-(100*(-y(128))/(y(56)*y(56))));
g1(79,128)=(-(100*1/y(56)));
g1(79,69)=1;
g1(80,29)=y(128)/y(56);
g1(80,56)=(-(y(128)*y(29)))/(y(56)*y(56));
g1(80,128)=y(29)/y(56);
g1(80,70)=1;
g1(81,70)=(-(100*1/y(70)));
g1(81,71)=1;
g1(82,12)=(-y(14));
g1(82,14)=(-(y(12)-1));
g1(82,80)=1;
g1(83,12)=(-y(14));
g1(83,14)=(-y(12));
g1(83,81)=1;
g1(84,14)=(-1);
g1(84,64)=1;
g1(84,77)=1;
g1(85,57)=(-y(104));
g1(85,79)=1;
g1(85,104)=(-y(57));
g1(86,32)=(-y(34));
g1(86,34)=(-y(32));
g1(86,74)=1;
g1(87,28)=(-1);
g1(87,36)=(-1);
g1(87,12)=(-y(14));
g1(87,14)=(-(y(12)-1));
g1(87,74)=(-1);
g1(87,76)=1;
g1(87,105)=(-y(112));
g1(87,112)=(-y(105));
g1(87,116)=(-1);
g1(88,74)=(-(100*1/y(74)));
g1(88,75)=1;
g1(89,72)=(-(100*1/y(72)));
g1(89,73)=1;
g1(90,105)=(-(100*1/y(105)));
g1(90,110)=1;
g1(91,94)=(-100);
g1(91,95)=1;
g1(92,101)=(-(1/(y(102)+y(104))));
g1(92,102)=(-((-(y(101)+y(103)))/((y(102)+y(104))*(y(102)+y(104)))));
g1(92,103)=(-(1/(y(102)+y(104))));
g1(92,104)=(-((-(y(101)+y(103)))/((y(102)+y(104))*(y(102)+y(104)))));
g1(92,111)=1;
g1(93,39)=1;
g1(93,46)=(-((-(y(102)+y(104)))/(y(46)*y(46))));
g1(93,102)=(-(1/y(46)));
g1(93,104)=(-(1/y(46)));
g1(94,40)=1;
g1(94,101)=(-((-y(102))/((y(101)+y(102))*(y(101)+y(102)))));
g1(94,102)=(-(y(101)/((y(101)+y(102))*(y(101)+y(102)))));
g1(95,41)=1;
g1(95,103)=(-((-y(104))/((y(103)+y(104))*(y(103)+y(104)))));
g1(95,104)=(-(y(103)/((y(103)+y(104))*(y(103)+y(104)))));

end
