objetivo((_, 2)).

capacidade((4,3)).

acao((J1,J2),encher1,(J1a,J2a)):-
                capacidade((C1, _)),
                J1 < C1,
                J1a = C1,
                J2a = J2.

acao((J1,J2),encher2,(J1a,J2a)):-
                capacidade((_, C2)),
                J2 < C2,
                J1a = J1,
                J2a = C2.

acao((J1,J2),esvaziar1,(J1a,J2a)):-
                J1 > 0,
                J1a is 0,
                J2a = J2.

acao((J1,J2),esvaziar2,(J1a,J2a)):-
                J2 > 0,
                J1a = J1,
                J2a is 0.

acao((J1,J2),passar12,(J1a,J2a)):-
	capacidade((_,C2)),
	J1 > 0,
	J2 < C2,
	min_list([J1, C2-J2], DIFF),
	J2a is J2 + DIFF,
	J2a =< C2,
	J1a is J1 - DIFF,
	J1a >= 0.

acao((J1,J2),passar21,(J1a,J2a)):-
                capacidade((C1,_)),
                J1 < C1,
                J2 > 0,
                min_list([J2, C1-J1], DIFF),
                J1a is J1 + DIFF,
                J1a =< C1,
                J2a is J2 - DIFF,
                J2a >= 0.

vizinhos(N, VizinhosN):-
        findall(X, acao(N, _, X), VizinhosN).

/*Letra D*/

/*Desta forma, ficará retornando true infinitamente(ou uma grande quantidade de vezes)*/

/**/

busca([EstadoAtual|_]):-
                objetivo(EstadoAtual).

   

busca([EstadoAtual| RestoDosEstados]):-
                vizinhos(EstadoAtual, VizinhosEstadoAtual),
                append(RestoDosEstados, VizinhosEstadoAtual, Fronteira),
                busca(Fronteira).
/**/

/*Letra E*/

/*Salvando a configuraçao de estados na variável ListaEstados*/

/**/
busca([EstadoAtual|_], ListaEstados):-
                objetivo(EstadoAtual),
    			ListaEstados = [EstadoAtual].

busca([EstadoAtual| RestoDosEstados], ListaEstados):-
    			\+objetivo(EstadoAtual),
                vizinhos(EstadoAtual, VizinhosEstadoAtual),
                append(RestoDosEstados, VizinhosEstadoAtual, Fronteira),
                busca(Fronteira, ListaEstadosAux),
    			!,
    			append([EstadoAtual], ListaEstadosAux, ListaEstados).
/**/
/*Letra F*/

/*Evitando estados repetidos*/
/**/
busca_interna([EstadoAtual|_], _):-
                objetivo(EstadoAtual).

busca_interna([EstadoAtual| RestoDosEstados], NosGeradosAnteriormente):-
                \+objetivo(EstadoAtual),
                member(EstadoAtual, NosGeradosAnteriormente),
                busca_interna(RestoDosEstados, NosGeradosAnteriormente).

busca_interna([EstadoAtual| RestoDosEstados], NosGeradosAnteriormente):-
                \+objetivo(EstadoAtual),
                \+member(EstadoAtual, NosGeradosAnteriormente),
                vizinhos(EstadoAtual, VizinhosEstadoAtual),
                append(RestoDosEstados, VizinhosEstadoAtual, Fronteira),
                busca_interna(Fronteira, [EstadoAtual | NosGeradosAnteriormente]).

busca(FronteiraInicial):-
                busca_interna(FronteiraInicial, []).
/**/

 

/*Letra G*/

/* Para busca em profundidade, basta trocar a ordem dos parametros:
Como estava na busca em largura: append(RestoDosEstados, VizinhosEstadoAtual, Fronteira)
Como ficará na busca em profundidade: append(VizinhosEstadoAtual, RestoDosEstados, Fronteira)*/

/**/
busca_interna([EstadoAtual|_], _):-
                objetivo(EstadoAtual).

busca_interna([EstadoAtual| RestoDosEstados], NosGeradosAnteriormente):-
                \+objetivo(EstadoAtual),
                member(EstadoAtual, NosGeradosAnteriormente),
                busca_interna(RestoDosEstados, NosGeradosAnteriormente).

busca_interna([EstadoAtual| RestoDosEstados], NosGeradosAnteriormente):-
                \+objetivo(EstadoAtual),
                \+member(EstadoAtual, NosGeradosAnteriormente),
                vizinhos(EstadoAtual, VizinhosEstadoAtual),
                append(VizinhosEstadoAtual, RestoDosEstados, Fronteira),
                busca_interna(Fronteira, [EstadoAtual | NosGeradosAnteriormente]).

busca(FronteiraInicial):-
                busca_interna(FronteiraInicial, []).
/**/