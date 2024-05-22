function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = Ltv_tight_partial.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 32
    T = [T; NaN(32 - size(T, 1), 1)];
end
T(24) = 1-T(15)*getPowerDeriv(y(62),params(17),1);
T(25) = 1-T(15)*getPowerDeriv(y(63),params(17),1);
T(26) = params(29)*getPowerDeriv(y(76),1-params(39),1);
T(27) = y(29)*(T(3)*params(29)*getPowerDeriv(y(76),(-params(39)),1)-T(2)*T(26))/(T(3)*T(3));
T(28) = (1-params(29))*getPowerDeriv(y(77),1-params(39),1);
T(29) = y(29)*(-(T(2)*T(28)))/(T(3)*T(3));
T(30) = y(29)*(T(3)*(1-params(29))*getPowerDeriv(y(77),(-params(39)),1)-T(6)*T(28))/(T(3)*T(3));
T(31) = params(30)*getPowerDeriv(y(78),1-params(39),1);
T(32) = (1-params(30))*getPowerDeriv(y(79),1-params(39),1);
end
