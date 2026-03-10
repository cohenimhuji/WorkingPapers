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
    T = QPMwCredit_24_5_22_nim.static_g1_tt(T, y, x, params);
end
g1 = zeros(55, 55);
g1(1,9)=params(3);
g1(2,1)=(-params(5));
g1(2,6)=1;
g1(2,7)=(-1);
g1(3,1)=(-((1-params(6))*params(8)));
g1(3,5)=(-(1-params(6)));
g1(3,7)=(-((1-params(6))*params(7)));
g1(3,8)=(-((1-params(6))*(1-params(7))));
g1(3,10)=1-params(6);
g1(4,8)=1-params(9);
g1(5,3)=(-(params(48)*4));
g1(5,5)=1;
g1(6,3)=1-params(13);
g1(7,4)=(-1);
g1(7,5)=1;
g1(7,9)=1;
g1(8,6)=(-1);
g1(8,7)=1;
g1(9,4)=1;
g1(9,6)=1;
g1(9,10)=(-1);
g1(10,2)=1;
g1(10,3)=(-1);
g1(11,1)=(-params(19));
g1(11,20)=params(17);
g1(11,24)=(-params(18));
g1(12,11)=(-params(22));
g1(12,17)=1;
g1(12,18)=(-1);
g1(12,28)=(-(params(25)+params(24)));
g1(12,29)=(-params(23));
g1(13,4)=(-0.25);
g1(13,14)=0.25;
g1(13,25)=(-0.25);
g1(14,11)=(-((1-params(26))*params(28)));
g1(14,15)=(-((1-params(26))*(1-params(60))));
g1(14,16)=(-((1-params(26))*params(60)));
g1(14,18)=(-((1-params(26))*params(27)));
g1(14,19)=(-((1-params(26))*(1-params(27))));
g1(14,21)=1-params(26);
g1(14,29)=(-((1-params(26))*params(29)));
g1(15,37)=1;
g1(16,12)=(-4);
g1(16,13)=4;
g1(16,38)=1;
g1(17,19)=1-params(30);
g1(18,2)=(-(4*params(52)));
g1(18,13)=(-(4*params(51)));
g1(18,15)=1;
g1(18,32)=params(53);
g1(19,2)=(-(4*params(52)));
g1(19,13)=(-(4*params(51)));
g1(19,16)=1;
g1(20,2)=(-params(46));
g1(20,13)=1-params(34);
g1(21,5)=1;
g1(21,15)=(-1);
g1(21,25)=1;
g1(22,23)=1-params(42);
g1(22,30)=(-1);
g1(23,30)=1-params(45);
g1(24,28)=1-params(36);
g1(25,14)=(-1);
g1(25,15)=1;
g1(25,20)=1;
g1(26,17)=(-1);
g1(26,18)=1;
g1(27,14)=1;
g1(27,17)=1;
g1(27,21)=(-1);
g1(28,22)=(-1);
g1(28,23)=1;
g1(28,24)=1;
g1(29,6)=0.25;
g1(29,17)=(-0.25);
g1(29,26)=1;
g1(30,12)=1;
g1(30,13)=(-1);
g1(31,27)=1;
g1(32,29)=1;
g1(33,32)=1;
g1(33,35)=(-params(55));
g1(33,36)=(-1);
g1(34,36)=1-params(56);
g1(35,11)=1;
g1(35,33)=(-1);
g1(35,35)=1;
g1(36,21)=(-1);
g1(36,31)=1;
g1(36,32)=(-1);
g1(37,11)=1.05;
g1(37,13)=1.0075;
g1(37,17)=0.251875;
g1(37,31)=(-0.25);
g1(37,33)=(-0.007500000000000062);
g1(37,34)=(-1.05);
g1(38,13)=params(17)*params(20)*(-4);
g1(38,17)=(-(params(17)*params(20)));
g1(38,31)=params(17)*params(20);
g1(38,35)=params(17)*params(20)*params(59);
g1(39,39)=1;
g1(40,7)=(-1);
g1(40,40)=1;
g1(41,7)=(-1);
g1(41,41)=1;
g1(42,7)=(-1);
g1(42,42)=1;
g1(43,8)=(-1);
g1(43,43)=1;
g1(44,8)=(-1);
g1(44,44)=1;
g1(45,8)=(-1);
g1(45,45)=1;
g1(46,18)=(-1);
g1(46,46)=1;
g1(47,18)=(-1);
g1(47,47)=1;
g1(48,18)=(-1);
g1(48,48)=1;
g1(49,19)=(-1);
g1(49,49)=1;
g1(50,19)=(-1);
g1(50,50)=1;
g1(51,19)=(-1);
g1(51,51)=1;
g1(52,6)=(-1);
g1(52,52)=1;
g1(53,6)=(-1);
g1(53,53)=1;
g1(54,17)=(-1);
g1(54,54)=1;
g1(55,17)=(-1);
g1(55,55)=1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
