function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(23, 1);
end
[T_order, T] = Ltv_tight_partial.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(95, 1);
    residual(1) = (y(23)) - (params(34)*y(27)*T(1));
    residual(2) = (T(5)) - (y(23)*y(31)*(1+params(36))+y(31)*y(23)*params(26)*(params(36)-1));
    residual(3) = (y(17)) - (T(5));
    residual(4) = (T(8)) - (y(23)*y(32));
    residual(5) = (y(18)) - (T(8));
    residual(6) = (y(34)) - (y(23)/(y(23)*params(26)));
    residual(7) = (y(7)^params(23)) - (y(23)*y(9));
    residual(8) = (y(23)*(y(87)-y(31)-y(31)*params(36))) - (y(31)*y(23)*params(26)*(params(36)-1));
    residual(9) = (y(40)) - (y(32)/y(31));
    residual(10) = (y(88)) - (y(87)/y(31));
    residual(11) = (y(25)+y(31)*(y(76)+y(80))+y(77)*y(32)+y(34)*y(38)) - (y(31)*(y(76)+y(80))+y(38)+y(87)*y(80)+y(7)*y(9)+y(11)+y(3)+y(91));
    residual(12) = (y(24)) - (params(35)*y(28)*T(9));
    residual(13) = (y(30)*T(12)) - ((1+params(36))*y(31)*y(24)+(params(36)-1)*y(31)*y(24)*params(27)-y(31)*y(33)*y(53));
    residual(14) = (y(30)*T(14)) - (y(32)*y(24));
    residual(15) = (y(33)) - (y(24)-y(24)*params(27)*y(69));
    residual(16) = (y(39)) - (y(78)*y(31)*y(53));
    residual(17) = (y(8)^params(23)) - (y(24)*y(10));
    residual(18) = (y(47)) - (y(8)*y(10));
    residual(19) = (y(26)+y(31)*y(78)+y(32)*y(79)+y(69)*y(39)) - (y(47)+y(39)+y(31)*y(78));
    residual(20) = (y(12)) - ((y(13)-1)/y(13)+y(62)*params(10)/y(13)*T(16)-y(62)*T(16)*params(10)*y(4)/y(13));
    residual(21) = (y(22)) - (y(6)*T(17)*T(18));
    residual(22) = (y(11)) - (y(22)-y(7)*y(9)-y(47)-T(20));
    residual(23) = (y(20)) - (T(20));
    residual(24) = (y(9)) - (y(22)*y(12)*params(37)/y(7));
    residual(25) = (y(47)) - (y(22)*y(12)*(1-params(37)));
    residual(26) = (y(89)) - ((y(90)-1)/y(90)+params(11)/y(90)*y(63)*T(21)-T(21)*y(63)*y(4)*params(11)/y(90));
    residual(27) = (y(89)) - (y(87)/y(32));
    residual(28) = (y(63)) - (y(62));
    residual(29) = (y(91)) - (y(80)*(y(32)-y(87))-T(23));
    residual(30) = (y(19)) - (T(23));
    residual(31) = (y(69)) - (y(34)+y(2));
    residual(32) = (y(2)) - (params(5)+params(4)*(y(53)-params(33))+y(1));
    residual(33) = (y(3)) - (y(39)*(y(69)-y(34)));
    residual(34) = (y(53)) - (params(33)-y(41));
    residual(35) = (y(64)) - (y(63)*params(48)+y(62)*(1-params(48)));
    residual(36) = (y(68)) - (y(68)*params(15)+(1-params(15))*(params(14)+params(12)*(y(64)-params(9))+params(13)*y(5))+y(42));
    residual(37) = (y(34)) - (1+1+y(68)-y(64));
residual(38) = y(38)+y(39);
    residual(39) = (y(80)) - (y(77)+y(79));
    residual(40) = (y(79)+y(77)+y(76)+y(78)) - (y(21));
    residual(41) = (y(21)) - (params(25)+x(9));
    residual(42) = (y(42)) - (y(42)*params(47)+x(10));
    residual(43) = (log(y(27))) - (log(y(27))*params(42)+x(1));
    residual(44) = (log(y(28))) - (params(42)*log(y(28))+x(2));
    residual(45) = (log(y(29))) - (log(y(29))*params(43)+x(3));
    residual(46) = (log(y(30))) - (params(43)*log(y(30))+x(4));
    residual(47) = (y(41)) - (y(41)*params(44)+x(5));
    residual(48) = (log(y(13))) - (log(params(18))*(1-params(7))+log(y(13))*params(7)+x(7));
    residual(49) = (log(y(90))) - (log(params(19))*(1-params(8))+log(y(90))*params(8)+x(8));
    residual(50) = (log(y(6))) - ((1-params(6))*log(params(16))+log(y(6))*params(6)+x(6));
    residual(51) = (y(1)) - (y(1)*params(3)+x(11));
    residual(52) = (y(74)) - (y(76)/y(77));
    residual(53) = (y(75)) - (y(78)/y(79));
    residual(54) = (y(34)*y(4)) - (1);
    residual(55) = (y(72)) - (100*log(y(25)));
    residual(56) = (y(57)) - (100*log(y(22)));
residual(57) = y(5);
    residual(58) = (y(73)) - (100*log(y(26)));
    residual(59) = (y(81)) - (100*log(y(76)));
    residual(60) = (y(82)) - (100*log(y(78)));
    residual(61) = (y(83)) - (100*log(y(77)));
    residual(62) = (y(84)) - (100*log(y(79)));
    residual(63) = (y(58)) - (100*log(y(31)));
    residual(64) = (y(59)) - (100*log(y(32)));
    residual(65) = (y(60)) - (100*log(y(40)));
    residual(66) = (y(61)) - (y(40)*400);
    residual(67) = (y(71)) - (100*log(y(39)));
    residual(68) = (y(43)) - (100*(y(34)-1));
    residual(69) = (y(95)) - (100*log(y(87)));
    residual(70) = (y(92)) - (y(39)/y(22));
    residual(71) = (y(93)) - (y(39)/y(47));
    residual(72) = (y(94)) - (y(39)*(y(69)-1)/y(47));
    residual(73) = (y(65)) - (100*(1+(y(62)-1)*4));
    residual(74) = (y(66)) - (100*(1+4*(y(63)-1)));
    residual(75) = (y(67)) - (100*(1+4*(y(64)-1)));
    residual(76) = (y(35)) - (100*y(68)*4);
    residual(77) = (y(37)) - (100*(1+(y(34)-1)*4));
    residual(78) = (y(36)) - (100*y(2)*4);
residual(79) = y(44);
    residual(80) = (y(45)) - (1-y(4));
    residual(81) = (y(46)) - (100*log(y(45)));
    residual(82) = (y(55)) - (y(39)*(y(34)-1));
    residual(83) = (y(56)) - (y(34)*y(39));
residual(84) = y(52);
    residual(85) = (y(54)) - (y(32)*y(79));
    residual(86) = (y(49)) - (y(7)*y(9));
    residual(87) = (y(51)) - (y(91)+y(3)+y(11)+y(87)*y(80)+y(39)*(y(34)-1)+y(49));
    residual(88) = (y(50)) - (100*log(y(49)));
    residual(89) = (y(48)) - (100*log(y(47)));
    residual(90) = (y(85)) - (100*log(y(80)));
    residual(91) = (y(70)) - (y(69)*100);
    residual(92) = (y(86)) - ((y(76)+y(78))/(y(77)+y(79)));
    residual(93) = (y(14)) - ((y(77)+y(79))/y(21));
    residual(94) = (y(15)) - (y(77)/(y(76)+y(77)));
    residual(95) = (y(16)) - (y(79)/(y(78)+y(79)));
end
