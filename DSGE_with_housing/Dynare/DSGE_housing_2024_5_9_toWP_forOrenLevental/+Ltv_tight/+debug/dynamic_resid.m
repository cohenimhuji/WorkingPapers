function [lhs, rhs] = dynamic_resid(y, x, params, steady_state)
T = NaN(26, 1);
lhs = NaN(95, 1);
rhs = NaN(95, 1);
T(1) = 1/(y(120)-params(24)*y(25))-params(24)*params(26)*y(217)*1/(y(215)-y(120)*params(24));
T(2) = params(29)*y(171)^(-params(39));
T(3) = params(29)*y(171)^(1-params(39))+(1-params(29))*y(172)^(1-params(39));
T(4) = T(2)/T(3);
T(5) = y(124)*T(4);
T(6) = (1-params(29))*y(172)^(-params(39));
T(7) = T(6)/T(3);
T(8) = y(124)*T(7);
T(9) = 1/(y(121)-params(24)*y(26))-params(24)*params(27)*y(218)*1/(y(216)-params(24)*y(121));
T(10) = params(30)*y(173)^(-params(39));
T(11) = params(30)*y(173)^(1-params(39))+(1-params(30))*y(174)^(1-params(39));
T(12) = T(10)/T(11);
T(13) = (1-params(30))*y(174)^(-params(39));
T(14) = T(13)/T(11);
T(15) = params(10)/y(108);
T(16) = params(9)^(1-params(17));
T(17) = y(157)-T(16)*y(62)^params(17);
T(18) = y(252)-T(16)*y(157)^params(17);
T(19) = y(102)^params(37);
T(20) = y(103)^(1-params(37));
T(21) = params(10)/2*T(17)^2;
T(22) = y(117)*T(21);
T(23) = y(158)-T(16)*y(63)^params(17);
T(24) = y(253)-T(16)*y(158)^params(17);
T(25) = params(11)/2*T(23)^2;
T(26) = y(175)*y(127)*T(25);
lhs(1) = y(118);
rhs(1) = params(34)*y(122)*T(1);
lhs(2) = T(5);
rhs(2) = y(118)*y(126)*(1+params(36))+params(26)*y(213)*y(221)*(params(36)-1);
lhs(3) = y(112);
rhs(3) = T(5);
lhs(4) = T(8);
rhs(4) = y(118)*y(127);
lhs(5) = y(113);
rhs(5) = T(8);
lhs(6) = y(129);
rhs(6) = y(118)/(params(26)*y(213));
lhs(7) = y(102)^params(23);
rhs(7) = y(118)*y(104);
lhs(8) = y(118)*(y(182)-y(126)-y(126)*params(36));
rhs(8) = params(26)*y(213)*y(221)*(params(36)-1);
lhs(9) = y(135);
rhs(9) = y(127)/y(126);
lhs(10) = y(183);
rhs(10) = y(182)/y(126);
lhs(11) = y(120)+y(126)*(y(171)+y(175))+y(172)*y(127)+y(34)*y(38);
rhs(11) = y(133)+y(126)*(y(76)+y(80))+y(182)*y(175)+y(102)*y(104)+y(106)+y(98)+y(186);
lhs(12) = y(119);
rhs(12) = params(35)*y(123)*T(9);
lhs(13) = y(125)*T(12);
rhs(13) = (1+params(36))*y(126)*y(119)+(params(36)-1)*y(221)*params(27)*y(214)-y(126)*y(128)*y(148);
lhs(14) = y(125)*T(14);
rhs(14) = y(127)*y(119);
lhs(15) = y(128);
rhs(15) = y(119)-params(27)*y(214)*y(164);
lhs(16) = y(134);
rhs(16) = y(173)*y(126)*y(148);
lhs(17) = y(103)^params(23);
rhs(17) = y(119)*y(105);
lhs(18) = y(142);
rhs(18) = y(103)*y(105);
lhs(19) = y(121)+y(126)*y(173)+y(127)*y(174)+y(69)*y(39);
rhs(19) = y(142)+y(134)+y(126)*y(78);
lhs(20) = y(107);
rhs(20) = (y(108)-1)/y(108)+y(157)*T(15)*T(17)-y(252)*params(10)*y(99)/y(108)*T(18)*y(212)/y(117);
lhs(21) = y(117);
rhs(21) = y(101)*T(19)*T(20);
lhs(22) = y(106);
rhs(22) = y(117)-y(102)*y(104)-y(142)-T(22);
lhs(23) = y(115);
rhs(23) = T(22);
lhs(24) = y(104);
rhs(24) = y(117)*y(107)*params(37)/y(102);
lhs(25) = y(142);
rhs(25) = y(117)*y(107)*(1-params(37));
lhs(26) = y(184);
rhs(26) = (y(185)-1)/y(185)+params(11)/y(185)*y(158)*T(23)-y(99)*params(11)/y(185)*y(253)*T(24);
lhs(27) = y(184);
rhs(27) = y(182)/y(127);
lhs(28) = y(158);
rhs(28) = y(157)*y(127)/y(32);
lhs(29) = y(186);
rhs(29) = y(175)*(y(127)-y(182))-T(26);
lhs(30) = y(114);
rhs(30) = T(26);
lhs(31) = y(164);
rhs(31) = y(129)+y(97);
lhs(32) = y(97);
rhs(32) = params(5)+params(4)*(y(148)-params(33))+y(96);
lhs(33) = y(98);
rhs(33) = y(39)*(y(69)-y(34));
lhs(34) = y(148);
rhs(34) = params(33)-y(136);
lhs(35) = y(159);
rhs(35) = y(158)*params(48)+y(157)*(1-params(48));
lhs(36) = y(163);
rhs(36) = params(15)*y(68)+(1-params(15))*(params(14)+params(12)*(y(159)-params(9))+params(13)*y(5))+y(137);
lhs(37) = y(129);
rhs(37) = 1+1+y(163)-y(254);
lhs(38) = y(133)+y(134);
rhs(38) = 0;
lhs(39) = y(175);
rhs(39) = y(172)+y(174);
lhs(40) = y(174)+y(172)+y(171)+y(173);
rhs(40) = y(116);
lhs(41) = y(116);
rhs(41) = params(25)+x(9);
lhs(42) = y(137);
rhs(42) = params(47)*y(42)+x(10);
lhs(43) = log(y(122));
rhs(43) = params(42)*log(y(27))+x(1);
lhs(44) = log(y(123));
rhs(44) = params(42)*log(y(28))+x(2);
lhs(45) = log(y(124));
rhs(45) = params(43)*log(y(29))+x(3);
lhs(46) = log(y(125));
rhs(46) = params(43)*log(y(30))+x(4);
lhs(47) = y(136);
rhs(47) = params(44)*y(41)+x(5);
lhs(48) = log(y(108));
rhs(48) = log(params(18))*(1-params(7))+params(7)*log(y(13))+x(7);
lhs(49) = log(y(185));
rhs(49) = log(params(19))*(1-params(8))+params(8)*log(y(90))+x(8);
lhs(50) = log(y(101));
rhs(50) = (1-params(6))*log(params(16))+params(6)*log(y(6))+x(6);
lhs(51) = y(96);
rhs(51) = params(3)*y(1)+x(11);
lhs(52) = y(169);
rhs(52) = y(171)/y(172);
lhs(53) = y(170);
rhs(53) = y(173)/y(174);
lhs(54) = y(129)*y(99);
rhs(54) = 1;
lhs(55) = y(167);
rhs(55) = 100*log(y(120));
lhs(56) = y(152);
rhs(56) = 100*log(y(117));
lhs(57) = y(100);
rhs(57) = y(152)-y(57);
lhs(58) = y(168);
rhs(58) = 100*log(y(121));
lhs(59) = y(176);
rhs(59) = 100*log(y(171));
lhs(60) = y(177);
rhs(60) = 100*log(y(173));
lhs(61) = y(178);
rhs(61) = 100*log(y(172));
lhs(62) = y(179);
rhs(62) = 100*log(y(174));
lhs(63) = y(153);
rhs(63) = 100*log(y(126));
lhs(64) = y(154);
rhs(64) = 100*log(y(127));
lhs(65) = y(155);
rhs(65) = 100*log(y(135));
lhs(66) = y(156);
rhs(66) = y(135)*400;
lhs(67) = y(166);
rhs(67) = 100*log(y(134));
lhs(68) = y(138);
rhs(68) = 100*(y(129)-1);
lhs(69) = y(190);
rhs(69) = 100*log(y(182));
lhs(70) = y(187);
rhs(70) = y(134)/y(117);
lhs(71) = y(188);
rhs(71) = y(134)/y(142);
lhs(72) = y(189);
rhs(72) = y(134)*(y(164)-1)/y(142);
lhs(73) = y(160);
rhs(73) = 100*(1+(y(157)-1)*4);
lhs(74) = y(161);
rhs(74) = 100*(1+4*(y(158)-1));
lhs(75) = y(162);
rhs(75) = 100*(1+4*(y(159)-1));
lhs(76) = y(130);
rhs(76) = 100*y(163)*4;
lhs(77) = y(132);
rhs(77) = 100*(1+(y(129)-1)*4);
lhs(78) = y(131);
rhs(78) = 100*y(97)*4;
lhs(79) = y(139);
rhs(79) = 100*(y(221)/y(126)-1);
lhs(80) = y(140);
rhs(80) = 1-y(221)*y(99)/y(126);
lhs(81) = y(141);
rhs(81) = 100*log(y(140));
lhs(82) = y(150);
rhs(82) = y(39)*(y(34)-1);
lhs(83) = y(151);
rhs(83) = y(34)*y(39);
lhs(84) = y(147);
rhs(84) = (-(y(134)-y(39)));
lhs(85) = y(149);
rhs(85) = y(127)*y(174);
lhs(86) = y(144);
rhs(86) = y(102)*y(104);
lhs(87) = y(146);
rhs(87) = y(186)+y(98)+y(106)+y(182)*y(175)+y(39)*(y(34)-1)+y(144);
lhs(88) = y(145);
rhs(88) = 100*log(y(144));
lhs(89) = y(143);
rhs(89) = 100*log(y(142));
lhs(90) = y(180);
rhs(90) = 100*log(y(175));
lhs(91) = y(165);
rhs(91) = y(164)*100;
lhs(92) = y(181);
rhs(92) = (y(171)+y(173))/(y(172)+y(174));
lhs(93) = y(109);
rhs(93) = (y(172)+y(174))/y(116);
lhs(94) = y(110);
rhs(94) = y(172)/(y(171)+y(172));
lhs(95) = y(111);
rhs(95) = y(174)/(y(173)+y(174));
end