function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = Ltv_tight.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 35
    T = [T; NaN(35 - size(T, 1), 1)];
end
T(27) = (-(T(16)*getPowerDeriv(y(62),params(17),1)));
T(28) = (-(T(16)*getPowerDeriv(y(63),params(17),1)));
T(29) = params(29)*getPowerDeriv(y(171),1-params(39),1);
T(30) = y(124)*(T(3)*params(29)*getPowerDeriv(y(171),(-params(39)),1)-T(2)*T(29))/(T(3)*T(3));
T(31) = (1-params(29))*getPowerDeriv(y(172),1-params(39),1);
T(32) = y(124)*(-(T(2)*T(31)))/(T(3)*T(3));
T(33) = y(124)*(T(3)*(1-params(29))*getPowerDeriv(y(172),(-params(39)),1)-T(6)*T(31))/(T(3)*T(3));
T(34) = params(30)*getPowerDeriv(y(173),1-params(39),1);
T(35) = (1-params(30))*getPowerDeriv(y(174),1-params(39),1);
end
