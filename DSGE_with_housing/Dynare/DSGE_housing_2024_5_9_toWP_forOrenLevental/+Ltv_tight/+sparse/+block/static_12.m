function [y, T] = static_12(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(5)=0;
  y(44)=0;
  y(52)=0;
  y(53)=params(33)-y(41);
  y(2)=params(5)+params(4)*(y(53)-params(33))+y(1);
  y(36)=100*y(2)*4;
end
