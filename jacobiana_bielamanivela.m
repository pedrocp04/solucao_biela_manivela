function jac = jacobiana_bielamanivela(x0,q,data)
  
R = data.R;
L = data.L;
 
A = x0(1);
X = x0(2);

jac = [-L*sin(A) -1;
     -L*cos(A) 0];
 
end