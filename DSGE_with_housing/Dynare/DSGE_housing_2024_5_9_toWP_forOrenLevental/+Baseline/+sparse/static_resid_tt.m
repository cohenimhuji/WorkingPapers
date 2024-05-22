function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 23
    T = [T; NaN(23 - size(T, 1), 1)];
end
T(1) = 1/(y(25)-y(25)*params(24))-1/(y(25)-y(25)*params(24))*y(27)*params(24)*params(26);
T(2) = params(29)*y(76)^(-params(39));
T(3) = params(29)*y(76)^(1-params(39))+(1-params(29))*y(77)^(1-params(39));
T(4) = T(2)/T(3);
T(5) = y(29)*T(4);
T(6) = (1-params(29))*y(77)^(-params(39));
T(7) = T(6)/T(3);
T(8) = y(29)*T(7);
T(9) = 1/(y(26)-params(24)*y(26))-1/(y(26)-params(24)*y(26))*y(28)*params(24)*params(27);
T(10) = params(30)*y(78)^(-params(39));
T(11) = params(30)*y(78)^(1-params(39))+(1-params(30))*y(79)^(1-params(39));
T(12) = T(10)/T(11);
T(13) = (1-params(30))*y(79)^(-params(39));
T(14) = T(13)/T(11);
T(15) = params(9)^(1-params(17));
T(16) = y(62)-T(15)*y(62)^params(17);
T(17) = y(7)^params(37);
T(18) = y(8)^(1-params(37));
T(19) = params(10)/2*T(16)^2;
T(20) = y(22)*T(19);
T(21) = y(63)-T(15)*y(63)^params(17);
T(22) = params(11)/2*T(21)^2;
T(23) = y(80)*y(32)*T(22);
end
