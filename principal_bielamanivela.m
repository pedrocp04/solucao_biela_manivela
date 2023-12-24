clear all
clc

% arquivo com equacoes de movimento
% funEDO = 'eqmov_bielamanivela_cinanal'; 
funEDO = 'eqmov_bielamanivela_cinnum'; 

% arquivos com equacoes cinematicas
funF = 'funcao_bielamanivela';
funJac = 'jacobiana_bielamanivela';

% intervalo de integracao
tspan = 0:0.01:30;

% condicoes iniciais
A0 = 0;
X0 = 0;
y10 = 0; % q0
y20 = 0; % dq0dt
yinicial = [y10;y20];

% parametros fisicos 
R = 0.10;
L = 0.35;
M1 = 1;
I1cm = 1e-1;
M2 = 2;
I2cm = 1e-1;
M3 = 5;
U2 = 0.15;
V2 = 0.1;
g = 9.81;

data = struct('R',R,'L',L,...
    'M1',M1,'I1cm',I1cm,'M2',M2,'I2cm',I2cm,'M3',M3,...
    'U2',U2,'V2',V2,'A0',A0,'X0',X0,'g',g,...
    'funF',funF,'funJac',funJac);

% integrador numerico
[t,y] = runge_kutta(funEDO,tspan,yinicial,data);

% solucoes
q = y(:,1); % coordenada generalizada
dqdt = y(:,2); % velocidade generalizada

% curvas
figure, plot(t,q)
xlabel('t')
ylabel('q')

figure, plot(t,dqdt)
xlabel('t')
ylabel('dqdt')



