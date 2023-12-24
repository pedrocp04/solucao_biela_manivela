function dydt = eqmov_bielamanivela_cinnum(t,y0,data)

% variaveis  
y1 = y0(1); % q
y2 = y0(2); % dqdt
  
% parametros fisicos
R = data.R;
L = data.L;
M1 = data.M1;
M2 = data.M2;
M3 = data.M3;
I1cm = data.I1cm;
I2cm = data.I2cm;
g = data.g;
U2 = data.U2;
V2 = data.V2;
A0 = data.A0;
X0 = data.X0;

% arquivos com equacoes cinematicas
funF = data.funF;
funJac = data.funJac;

% cinematica (solucao numerica)
persistent x0

if isempty(x0)
   x0 = [A0;X0];
end
  
% posicoes
[xpos,iter] = metodo_newton(x0,y1,funF,funJac,data);
A = xpos(1);
X = xpos(2);
x0 = xpos;  

% matriz jacobiana
J = feval(funJac,xpos,y1,data); 

% velocidades
H = [R*sin(y1);-R*cos(y1)];
Kc = inv(J)*H; 
Ka = Kc(1); 
Kx = Kc(2);

% aceleracoes
dJdq = [-L*Ka*cos(A) 0;
     L*Ka*sin(A) 0];
dHdq = [R*cos(y1);R*sin(y1)];   
Lc = inv(J)*(-dJdq*Kc+dHdq);
La = Lc(1);
Lx = Lc(2);
  
K1x = (R/2)*cos(y1);
K1y = (R/2)*sin(y1);
  
K2x = -R*sin(y1)-Ka*(U2*sin(A)-V2*cos(A));
K2y = R*cos(y1)-Ka*(U2*cos(A)+V2*sin(A));

L1x = -(R/2)*sin(y1);
L1y = (R/2)*cos(y1);

L2x =-R*cos(y1)-La*(U2*sin(A)-V2*cos(A))...
      -Ka^2*(U2*cos(A)+V2*sin(A)); 
L2y =-R*sin(y1)-La*(U2*cos(A)+V2*sin(A))...
      -Ka^2*(-U2*sin(A)+V2*cos(A)); 

% forca generalizada
C = 0;
F = 0;
Qnc = C + F*Kx;

% termo relacionado ao potencial
dVdq = M1*g*(R/2)*cos(y1) ...
      + M2*(R*cos(y1)-U2*Ka*cos(A)-V2*Ka*sin(A));

% inercia generalizada
Igen = M1*(K1x^2+K1y^2) + I1cm ...
       + M2*(K2x^2+K2y^2) + I2cm*Ka^2 ...
       + M3*Kx^2;

% coeficiente centripeto
Ccent = M1*(K1x*L1x + K1y*L1y) ...
        + M2*(K2x*L2x + K2y*L2y) ...
        + I2cm*Ka*La + M3*Kx*Lx;
    
% equacoes de movimento
dydt = [y2;
       (1/Igen)*(Qnc-Ccent*y2^2-dVdq)];
