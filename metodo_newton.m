function [x,iter] = metodo_newton(x0,q,funF,funJac,data)

N = 100;            % numero de iteracoes
epsilon = 1e-3;     % tolerancia
maxval = 1e4;       % divergencia

while N>0
    
  % Passo 1
  F = feval(funF,x0,q,data);
  Jac  = feval(funJac,x0,q,data);
  
  % Passo 2
  if max(abs(F)) <epsilon
      x = x0;
      iter = 100-N;
      return;
  end
  
  if max(abs(F))>maxval
      iter = 100-N;
      disp(['numero de iteracoes=',num2str(iter)]);
      error('solucao diverge');
      abort;
  end
  
  % Passp 3
  if  abs(det(Jac))<epsilon
    error('jacobiana esta proxima de ser singular - tentar outro x0')
    abort;
  end
  
  x1 = x0-inv(Jac)*F;
  
  % Passo 4
  
  if max(abs(x1-x0))<epsilon
      x = x1;
      iter = 100-N;
      return
  end
  
  % Passo 5
  x0 = x1;
  
N = N-1;    
end

  error('solucao nao converge')

  abort;
  
  
  
  
  
  
  
  