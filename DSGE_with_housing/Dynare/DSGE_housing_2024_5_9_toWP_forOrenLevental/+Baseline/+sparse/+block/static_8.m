function [y, T, residual, g1] = static_8(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(1, 1);
  T(5)=log(y(13));
  residual(1)=(T(5))-(log(params(18))*(1-params(7))+T(5)*params(7)+x(7));
if nargout > 3
    g1_v = NaN(1, 1);
g1_v(1)=1/y(13)-params(7)*1/y(13);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 1, 1);
end
end
