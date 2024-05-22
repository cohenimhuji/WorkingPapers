function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(32, 1);
end
[T_order, T] = Ltv_tight_partial.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(274, 1);
g1_v(1)=(-1);
g1_v(2)=1-params(3);
g1_v(3)=(-1);
g1_v(4)=1;
g1_v(5)=(-400);
g1_v(6)=(-1);
g1_v(7)=1;
g1_v(8)=(-1);
g1_v(9)=y(62)*params(10)/y(13)*T(16);
g1_v(10)=params(11)/y(90)*y(63)*T(21);
g1_v(11)=y(34);
g1_v(12)=1;
g1_v(13)=(-((1-params(15))*params(13)));
g1_v(14)=1;
g1_v(15)=(-(T(17)*T(18)));
g1_v(16)=1/y(6)-params(6)*1/y(6);
g1_v(17)=getPowerDeriv(y(7),params(23),1);
g1_v(18)=(-y(9));
g1_v(19)=(-(T(18)*y(6)*getPowerDeriv(y(7),params(37),1)));
g1_v(20)=y(9);
g1_v(21)=(-((-(y(22)*y(12)*params(37)))/(y(7)*y(7))));
g1_v(22)=(-y(9));
g1_v(23)=getPowerDeriv(y(8),params(23),1);
g1_v(24)=(-y(10));
g1_v(25)=(-(y(6)*T(17)*getPowerDeriv(y(8),1-params(37),1)));
g1_v(26)=(-y(23));
g1_v(27)=(-y(7));
g1_v(28)=y(7);
g1_v(29)=1;
g1_v(30)=(-y(7));
g1_v(31)=(-y(24));
g1_v(32)=(-y(8));
g1_v(33)=(-1);
g1_v(34)=1;
g1_v(35)=(-1);
g1_v(36)=1;
g1_v(37)=(-(y(22)*params(37)/y(7)));
g1_v(38)=(-(y(22)*(1-params(37))));
g1_v(39)=(-((y(13)-(y(13)-1))/(y(13)*y(13))+y(62)*T(16)*(-params(10))/(y(13)*y(13))-y(62)*T(16)*(-(params(10)*y(4)))/(y(13)*y(13))));
g1_v(40)=1/y(13)-params(7)*1/y(13);
g1_v(41)=1;
g1_v(42)=1;
g1_v(43)=1;
g1_v(44)=1;
g1_v(45)=1;
g1_v(46)=1;
g1_v(47)=1;
g1_v(48)=(-1);
g1_v(49)=1;
g1_v(50)=(-((-(y(77)+y(79)))/(y(21)*y(21))));
g1_v(51)=1;
g1_v(52)=(-(1-T(19)));
g1_v(53)=(-T(19));
g1_v(54)=(-(y(12)*params(37)/y(7)));
g1_v(55)=(-(y(12)*(1-params(37))));
g1_v(56)=(-(100*1/y(22)));
g1_v(57)=(-((-y(39))/(y(22)*y(22))));
g1_v(58)=1;
g1_v(59)=(-(y(31)*(1+params(36))+(params(36)-1)*params(26)*y(31)));
g1_v(60)=(-y(32));
g1_v(61)=(-y(9));
g1_v(62)=y(87)-y(31)-y(31)*params(36)-(params(36)-1)*params(26)*y(31);
g1_v(63)=1;
g1_v(64)=(-(y(31)*(1+params(36))+(params(36)-1)*y(31)*params(27)));
g1_v(65)=(-y(32));
g1_v(66)=(-(1-params(27)*y(69)));
g1_v(67)=(-y(10));
g1_v(68)=(-(params(34)*y(27)*((-(1-params(24)))/((y(25)-y(25)*params(24))*(y(25)-y(25)*params(24)))-y(27)*params(24)*params(26)*(-(1-params(24)))/((y(25)-y(25)*params(24))*(y(25)-y(25)*params(24))))));
g1_v(69)=1;
g1_v(70)=(-(100*1/y(25)));
g1_v(71)=(-(params(35)*y(28)*((-(1-params(24)))/((y(26)-params(24)*y(26))*(y(26)-params(24)*y(26)))-y(28)*params(24)*params(27)*(-(1-params(24)))/((y(26)-params(24)*y(26))*(y(26)-params(24)*y(26))))));
g1_v(72)=1;
g1_v(73)=(-(100*1/y(26)));
g1_v(74)=(-(params(34)*(T(1)+y(27)*(-(1/(y(25)-y(25)*params(24))*params(24)*params(26))))));
g1_v(75)=1/y(27)-params(42)*1/y(27);
g1_v(76)=(-(params(35)*(T(9)+y(28)*(-(1/(y(26)-params(24)*y(26))*params(24)*params(27))))));
g1_v(77)=1/y(28)-params(42)*1/y(28);
g1_v(78)=T(4);
g1_v(79)=(-T(4));
g1_v(80)=T(7);
g1_v(81)=(-T(7));
g1_v(82)=1/y(29)-params(43)*1/y(29);
g1_v(83)=T(12);
g1_v(84)=T(14);
g1_v(85)=1/y(30)-params(43)*1/y(30);
g1_v(86)=(-(y(23)*(1+params(36))+y(23)*params(26)*(params(36)-1)));
g1_v(87)=y(23)*((-1)-params(36))-y(23)*params(26)*(params(36)-1);
g1_v(88)=(-((-y(32))/(y(31)*y(31))));
g1_v(89)=(-((-y(87))/(y(31)*y(31))));
g1_v(90)=(-((1+params(36))*y(24)+(params(36)-1)*y(24)*params(27)-y(33)*y(53)));
g1_v(91)=(-(y(78)*y(53)));
g1_v(92)=(-(100*1/y(31)));
g1_v(93)=(-y(23));
g1_v(94)=(-(1/y(31)));
g1_v(95)=y(77);
g1_v(96)=(-y(24));
g1_v(97)=y(79);
g1_v(98)=(-((-y(87))/(y(32)*y(32))));
g1_v(99)=(-(y(80)-y(80)*T(22)));
g1_v(100)=(-(y(80)*T(22)));
g1_v(101)=(-(100*1/y(32)));
g1_v(102)=(-y(79));
g1_v(103)=y(31)*y(53);
g1_v(104)=1;
g1_v(105)=1;
g1_v(106)=y(38);
g1_v(107)=(-1);
g1_v(108)=y(39);
g1_v(109)=1;
g1_v(110)=y(4);
g1_v(111)=(-100);
g1_v(112)=(-400);
g1_v(113)=(-y(39));
g1_v(114)=(-y(39));
g1_v(115)=(-y(39));
g1_v(116)=1;
g1_v(117)=1;
g1_v(118)=1;
g1_v(119)=y(34)-1;
g1_v(120)=1;
g1_v(121)=1;
g1_v(122)=y(69)-1;
g1_v(123)=(-(y(69)-y(34)));
g1_v(124)=1;
g1_v(125)=(-(100*1/y(39)));
g1_v(126)=(-(1/y(22)));
g1_v(127)=(-(1/y(47)));
g1_v(128)=(-((y(69)-1)/y(47)));
g1_v(129)=(-(y(34)-1));
g1_v(130)=(-y(34));
g1_v(131)=(-(y(34)-1));
g1_v(132)=1;
g1_v(133)=(-(100*1/y(40)));
g1_v(134)=(-400);
g1_v(135)=1;
g1_v(136)=1-params(44);
g1_v(137)=(-1);
g1_v(138)=1-params(47);
g1_v(139)=1;
g1_v(140)=1;
g1_v(141)=1;
g1_v(142)=(-(100*1/y(45)));
g1_v(143)=1;
g1_v(144)=1;
g1_v(145)=(-1);
g1_v(146)=1;
g1_v(147)=1;
g1_v(148)=(-((-y(39))/(y(47)*y(47))));
g1_v(149)=(-((-(y(39)*(y(69)-1)))/(y(47)*y(47))));
g1_v(150)=(-(100*1/y(47)));
g1_v(151)=1;
g1_v(152)=1;
g1_v(153)=(-1);
g1_v(154)=(-(100*1/y(49)));
g1_v(155)=1;
g1_v(156)=1;
g1_v(157)=1;
g1_v(158)=y(31)*y(33);
g1_v(159)=(-(y(31)*y(78)));
g1_v(160)=(-params(4));
g1_v(161)=1;
g1_v(162)=1;
g1_v(163)=1;
g1_v(164)=1;
g1_v(165)=1;
g1_v(166)=1;
g1_v(167)=1;
g1_v(168)=1;
g1_v(169)=1;
g1_v(170)=(-(params(10)/y(13)*T(16)+y(62)*params(10)/y(13)*T(24)-(T(16)*params(10)*y(4)/y(13)+y(62)*params(10)*y(4)/y(13)*T(24))));
g1_v(171)=y(22)*params(10)/2*T(24)*2*T(16);
g1_v(172)=(-(y(22)*params(10)/2*T(24)*2*T(16)));
g1_v(173)=(-1);
g1_v(174)=(-(1-params(48)));
g1_v(175)=(-400);
g1_v(176)=(-(params(11)/y(90)*T(21)+params(11)/y(90)*y(63)*T(25)-(y(63)*y(4)*params(11)/y(90)*T(25)+T(21)*y(4)*params(11)/y(90))));
g1_v(177)=1;
g1_v(178)=y(80)*y(32)*params(11)/2*T(25)*2*T(21);
g1_v(179)=(-(y(80)*y(32)*params(11)/2*T(25)*2*T(21)));
g1_v(180)=(-params(48));
g1_v(181)=(-400);
g1_v(182)=1;
g1_v(183)=(-((1-params(15))*params(12)));
g1_v(184)=1;
g1_v(185)=(-400);
g1_v(186)=1;
g1_v(187)=1;
g1_v(188)=1;
g1_v(189)=1-params(15);
g1_v(190)=(-1);
g1_v(191)=(-400);
g1_v(192)=y(24)*params(27);
g1_v(193)=y(39);
g1_v(194)=1;
g1_v(195)=(-y(39));
g1_v(196)=(-(y(39)/y(47)));
g1_v(197)=(-100);
g1_v(198)=1;
g1_v(199)=1;
g1_v(200)=1;
g1_v(201)=1;
g1_v(202)=1;
g1_v(203)=1;
g1_v(204)=T(27);
g1_v(205)=(-T(27));
g1_v(206)=y(29)*(-(T(6)*T(26)))/(T(3)*T(3));
g1_v(207)=(-(y(29)*(-(T(6)*T(26)))/(T(3)*T(3))));
g1_v(208)=1;
g1_v(209)=(-(1/y(77)));
g1_v(210)=(-(100*1/y(76)));
g1_v(211)=(-(1/(y(77)+y(79))));
g1_v(212)=(-((-y(77))/((y(76)+y(77))*(y(76)+y(77)))));
g1_v(213)=T(29);
g1_v(214)=(-T(29));
g1_v(215)=T(30);
g1_v(216)=(-T(30));
g1_v(217)=y(32);
g1_v(218)=(-1);
g1_v(219)=1;
g1_v(220)=(-((-y(76))/(y(77)*y(77))));
g1_v(221)=(-(100*1/y(77)));
g1_v(222)=(-((-(y(76)+y(78)))/((y(77)+y(79))*(y(77)+y(79)))));
g1_v(223)=(-(1/y(21)));
g1_v(224)=(-(y(76)/((y(76)+y(77))*(y(76)+y(77)))));
g1_v(225)=y(30)*(T(11)*params(30)*getPowerDeriv(y(78),(-params(39)),1)-T(10)*T(31))/(T(11)*T(11));
g1_v(226)=y(30)*(-(T(13)*T(31)))/(T(11)*T(11));
g1_v(227)=(-(y(31)*y(53)));
g1_v(228)=1;
g1_v(229)=(-(1/y(79)));
g1_v(230)=(-(100*1/y(78)));
g1_v(231)=(-(1/(y(77)+y(79))));
g1_v(232)=(-((-y(79))/((y(78)+y(79))*(y(78)+y(79)))));
g1_v(233)=y(30)*(-(T(10)*T(32)))/(T(11)*T(11));
g1_v(234)=y(30)*(T(11)*(1-params(30))*getPowerDeriv(y(79),(-params(39)),1)-T(13)*T(32))/(T(11)*T(11));
g1_v(235)=y(32);
g1_v(236)=(-1);
g1_v(237)=1;
g1_v(238)=(-((-y(78))/(y(79)*y(79))));
g1_v(239)=(-(100*1/y(79)));
g1_v(240)=(-y(32));
g1_v(241)=(-((-(y(76)+y(78)))/((y(77)+y(79))*(y(77)+y(79)))));
g1_v(242)=(-(1/y(21)));
g1_v(243)=(-(y(78)/((y(78)+y(79))*(y(78)+y(79)))));
g1_v(244)=y(31)-(y(31)+y(87));
g1_v(245)=(-(y(32)-y(87)-y(32)*T(22)));
g1_v(246)=(-(y(32)*T(22)));
g1_v(247)=1;
g1_v(248)=(-y(87));
g1_v(249)=(-(100*1/y(80)));
g1_v(250)=1;
g1_v(251)=1;
g1_v(252)=1;
g1_v(253)=1;
g1_v(254)=1;
g1_v(255)=1;
g1_v(256)=y(23);
g1_v(257)=(-(1/y(31)));
g1_v(258)=(-y(80));
g1_v(259)=(-(1/y(32)));
g1_v(260)=y(80);
g1_v(261)=(-(100*1/y(87)));
g1_v(262)=(-y(80));
g1_v(263)=1;
g1_v(264)=1;
g1_v(265)=1;
g1_v(266)=(-((y(90)-(y(90)-1))/(y(90)*y(90))+T(21)*y(63)*(-params(11))/(y(90)*y(90))-T(21)*y(63)*(-(y(4)*params(11)))/(y(90)*y(90))));
g1_v(267)=1/y(90)-params(8)*1/y(90);
g1_v(268)=(-1);
g1_v(269)=1;
g1_v(270)=(-1);
g1_v(271)=1;
g1_v(272)=1;
g1_v(273)=1;
g1_v(274)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 95, 95);
end
