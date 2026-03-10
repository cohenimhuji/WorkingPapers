function [y, T] = dynamic_10(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(96)=params(3)*y(1)+x(11);
  y(148)=params(33)-y(136);
  y(97)=params(5)+params(4)*(y(148)-params(33))+y(96);
  y(131)=100*y(97)*4;
end
