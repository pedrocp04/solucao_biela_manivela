function [t,y] = runge_kutta(fun,tspan,x0,data)

a = tspan(1);        % tempo inicial
b = tspan(end);      % tempo final
N = length(tspan-1); % numero de passos

h = (b-a)/N;   % tamanho do passo
t(1) = a;      % salva tempo inicial
y(:,1) = x0;   % condicao inicial

for i=1:N
k1 = h*feval(fun,t(i),y(:,i),data);
k2 = h*feval(fun,t(i)+h/2,y(:,i)+k1/2,data); 
k3 = h*feval(fun,t(i)+h/2,y(:,i)+k2/2,data);
k4 = h*feval(fun,t(i)+h,y(:,i)+k3,data);
y(:,i+1) = y(:,i)+(1/6)*(k1+2*k2+2*k3+k4);
t(i+1) = a + i*h;
end

t = t';
y = y'; 