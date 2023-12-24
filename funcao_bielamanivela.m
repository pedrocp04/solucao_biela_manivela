function f = funcao_bielamanivela(x0,q,data)
  
R = data.R;
L = data.L;
 
A = x0(1);
X = x0(2);  
  
f = [R*cos(q)+L*cos(A)-X;
      R*sin(q)-L*sin(A)];

end