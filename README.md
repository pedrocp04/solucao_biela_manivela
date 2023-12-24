# Códigos em matlab para sistema dinâmico de biela-manivela #

Este projeto contém códigos em matlab para calcular as equações diferenciais ordinárias (EDOs) de um sistema dinâmico de biela-manivela e obter a posição, velocidade e aceleração das barras do mecanismo. Além disso, o projeto plota gráficos de cada uma das componentes para que seja feita a simulação do movimento do mecanismo.

## Requisitos ##
Para executar os códigos deste projeto, você precisa ter o matlab instalado em seu computador. Você também precisa ter os seguintes arquivos na mesma pasta:

eqmov_bielamanivela_cinnum.m: Este arquivo contém uma função auxiliar que calcula as posições, velocidades e acelerações das barras do mecanismo de forma numérica.
funcao_bielamanivela.m: Este arquivo contém uma função auxiliar que calcula as posições, velocidades e acelerações das barras do mecanismo de forma analítica.
principal_bielamanivela.m: Este arquivo é o principal que irá resolver as EDOs e plotar os gráficos.
metodo_newton.m: Esqte arquivo contém o método utilizado para resolver parte das EDOs.
runge_kutta.m: Outro método para calcular as EDOs.
jacobiana_bielamanivela.m: Calcula a jacobiana que é usada nos cálculos da posição e velocidade.


### Como usar ###
Para usar este projeto, basta abrir o arquivo **principal_bielamanivela.m** no matlab e executá-lo. Você pode alterar os parâmetros do mecanismo, como o comprimento das barras, o ângulo inicial da manivela, a velocidade angular da manivela e o intervalo de tempo da simulação, modificando as variáveis no início do código. Os resultados serão mostrados na janela de comando e nos gráficos gerados.

Referências
Este projeto foi baseado nas seguintes referências:

Mecanismos com 1 Grau de Liberdade - Departamento de Engenharia Mecânica
<[Mecanismo Biela Manivela - Posição | Engenharia - YouTube](https://www.youtube.com/watch?v=BeseyBNOAj0)>
Análise cinemática em mecanismo pistão-biela-manivela … - Unesp
