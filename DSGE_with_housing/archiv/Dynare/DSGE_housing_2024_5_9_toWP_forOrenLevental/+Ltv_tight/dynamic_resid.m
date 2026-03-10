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
    T = Ltv_tight.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(95, 1);
    residual(1) = (y(48)) - (params(34)*y(52)*T(1));
    residual(2) = (T(5)) - (y(48)*y(56)*(1+params(36))+params(26)*y(122)*y(128)*(params(36)-1));
    residual(3) = (y(42)) - (T(5));
    residual(4) = (T(8)) - (y(48)*y(57));
    residual(5) = (y(43)) - (T(8));
    residual(6) = (y(59)) - (y(48)/(params(26)*y(122)));
    residual(7) = (y(32)^params(23)) - (y(48)*y(34));
    residual(8) = (y(48)*(y(112)-y(56)-y(56)*params(36))) - (params(26)*y(122)*y(128)*(params(36)-1));
    residual(9) = (y(65)) - (y(57)/y(56));
    residual(10) = (y(113)) - (y(112)/y(56));
    residual(11) = (y(50)+y(56)*(y(101)+y(105))+y(102)*y(57)+y(12)*y(13)) - (y(63)+y(56)*(y(22)+y(24))+y(112)*y(105)+y(32)*y(34)+y(36)+y(28)+y(116));
    residual(12) = (y(49)) - (params(35)*y(53)*T(9));
    residual(13) = (y(55)*T(12)) - ((1+params(36))*y(56)*y(49)+(params(36)-1)*y(128)*params(27)*y(123)-y(56)*y(58)*y(78));
    residual(14) = (y(55)*T(14)) - (y(57)*y(49));
    residual(15) = (y(58)) - (y(49)-params(27)*y(123)*y(94));
    residual(16) = (y(64)) - (y(103)*y(56)*y(78));
    residual(17) = (y(33)^params(23)) - (y(49)*y(35));
    residual(18) = (y(72)) - (y(33)*y(35));
    residual(19) = (y(51)+y(56)*y(103)+y(57)*y(104)+y(21)*y(14)) - (y(72)+y(64)+y(56)*y(23));
    residual(20) = (y(37)) - ((y(38)-1)/y(38)+y(87)*T(15)*T(17)-y(129)*params(10)*y(29)/y(38)*T(18)*y(121)/y(47));
    residual(21) = (y(47)) - (y(31)*T(19)*T(20));
    residual(22) = (y(36)) - (y(47)-y(32)*y(34)-y(72)-T(22));
    residual(23) = (y(45)) - (T(22));
    residual(24) = (y(34)) - (y(47)*y(37)*params(37)/y(32));
    residual(25) = (y(72)) - (y(47)*y(37)*(1-params(37)));
    residual(26) = (y(114)) - ((y(115)-1)/y(115)+params(11)/y(115)*y(88)*T(23)-y(29)*params(11)/y(115)*y(130)*T(24));
    residual(27) = (y(114)) - (y(112)/y(57));
    residual(28) = (y(88)) - (y(87)*y(57)/y(11));
    residual(29) = (y(116)) - (y(105)*(y(57)-y(112))-T(26));
    residual(30) = (y(44)) - (T(26));
    residual(31) = (y(94)) - (y(59)+y(27));
    residual(32) = (y(27)) - (params(5)+params(4)*(y(78)-params(33))+y(26));
    residual(33) = (y(28)) - (y(14)*(y(21)-y(12)));
    residual(34) = (y(78)) - (params(33)-y(66));
    residual(35) = (y(89)) - (y(88)*params(48)+y(87)*(1-params(48)));
    residual(36) = (y(93)) - (params(15)*y(20)+(1-params(15))*(params(14)+params(12)*(y(89)-params(9))+params(13)*y(2))+y(67));
    residual(37) = (y(59)) - (1+1+y(93)-y(131));
residual(38) = y(63)+y(64);
    residual(39) = (y(105)) - (y(102)+y(104));
    residual(40) = (y(104)+y(102)+y(101)+y(103)) - (y(46));
    residual(41) = (y(46)) - (params(25)+x(it_, 9));
    residual(42) = (y(67)) - (params(47)*y(16)+x(it_, 10));
    residual(43) = (log(y(52))) - (params(42)*log(y(7))+x(it_, 1));
    residual(44) = (log(y(53))) - (params(42)*log(y(8))+x(it_, 2));
    residual(45) = (log(y(54))) - (params(43)*log(y(9))+x(it_, 3));
    residual(46) = (log(y(55))) - (params(43)*log(y(10))+x(it_, 4));
    residual(47) = (y(66)) - (params(44)*y(15)+x(it_, 5));
    residual(48) = (log(y(38))) - (log(params(18))*(1-params(7))+params(7)*log(y(4))+x(it_, 7));
    residual(49) = (log(y(115))) - (log(params(19))*(1-params(8))+params(8)*log(y(25))+x(it_, 8));
    residual(50) = (log(y(31))) - ((1-params(6))*log(params(16))+params(6)*log(y(3))+x(it_, 6));
    residual(51) = (y(26)) - (params(3)*y(1)+x(it_, 11));
    residual(52) = (y(99)) - (y(101)/y(102));
    residual(53) = (y(100)) - (y(103)/y(104));
    residual(54) = (y(59)*y(29)) - (1);
    residual(55) = (y(97)) - (100*log(y(50)));
    residual(56) = (y(82)) - (100*log(y(47)));
    residual(57) = (y(30)) - (y(82)-y(17));
    residual(58) = (y(98)) - (100*log(y(51)));
    residual(59) = (y(106)) - (100*log(y(101)));
    residual(60) = (y(107)) - (100*log(y(103)));
    residual(61) = (y(108)) - (100*log(y(102)));
    residual(62) = (y(109)) - (100*log(y(104)));
    residual(63) = (y(83)) - (100*log(y(56)));
    residual(64) = (y(84)) - (100*log(y(57)));
    residual(65) = (y(85)) - (100*log(y(65)));
    residual(66) = (y(86)) - (y(65)*400);
    residual(67) = (y(96)) - (100*log(y(64)));
    residual(68) = (y(68)) - (100*(y(59)-1));
    residual(69) = (y(120)) - (100*log(y(112)));
    residual(70) = (y(117)) - (y(64)/y(47));
    residual(71) = (y(118)) - (y(64)/y(72));
    residual(72) = (y(119)) - (y(64)*(y(94)-1)/y(72));
    residual(73) = (y(90)) - (100*(1+(y(87)-1)*4));
    residual(74) = (y(91)) - (100*(1+4*(y(88)-1)));
    residual(75) = (y(92)) - (100*(1+4*(y(89)-1)));
    residual(76) = (y(60)) - (100*y(93)*4);
    residual(77) = (y(62)) - (100*(1+(y(59)-1)*4));
    residual(78) = (y(61)) - (100*y(27)*4);
    residual(79) = (y(69)) - (100*(y(128)/y(56)-1));
    residual(80) = (y(70)) - (1-y(128)*y(29)/y(56));
    residual(81) = (y(71)) - (100*log(y(70)));
    residual(82) = (y(80)) - (y(14)*(y(12)-1));
    residual(83) = (y(81)) - (y(12)*y(14));
    residual(84) = (y(77)) - ((-(y(64)-y(14))));
    residual(85) = (y(79)) - (y(57)*y(104));
    residual(86) = (y(74)) - (y(32)*y(34));
    residual(87) = (y(76)) - (y(116)+y(28)+y(36)+y(112)*y(105)+y(14)*(y(12)-1)+y(74));
    residual(88) = (y(75)) - (100*log(y(74)));
    residual(89) = (y(73)) - (100*log(y(72)));
    residual(90) = (y(110)) - (100*log(y(105)));
    residual(91) = (y(95)) - (y(94)*100);
    residual(92) = (y(111)) - ((y(101)+y(103))/(y(102)+y(104)));
    residual(93) = (y(39)) - ((y(102)+y(104))/y(46));
    residual(94) = (y(40)) - (y(102)/(y(101)+y(102)));
    residual(95) = (y(41)) - (y(104)/(y(103)+y(104)));

end
