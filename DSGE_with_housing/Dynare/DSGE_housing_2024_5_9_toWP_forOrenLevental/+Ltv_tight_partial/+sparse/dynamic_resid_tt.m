function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 26
    T = [T; NaN(26 - size(T, 1), 1)];
end
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
end
