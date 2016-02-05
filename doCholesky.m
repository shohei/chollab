function doCholesky
A=dlmread('input.txt');
%check symmetry of matrix
fid=fopen('out.txt','w');
if isequal(A,A')
    %do cholesky factorization
    L = chol(A);
    S = sparse(L);
    [i,j,val] = find(S);
    data_dump = [i,j,val];
    fprintf( fid,'%d %d %f\n', data_dump );
else
    %do LU factorization
    [L,U] = lu(A);
    S = sparse(L);
    [i,j,val] = find(S);
    data_dump = [i,j,val];
    fprintf( fid,'%d %d %f\n', data_dump );
end

fclose(fid);
end