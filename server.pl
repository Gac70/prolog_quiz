:- module(server, []).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(arouter)).
:- use_module('common/handler').
:- use_module('controllers/app_controller').

% Inicialização do servidor
server(Port) :- http_server(server_handler, [port(Port)]).

% Rotas
:- route_get(/, index()).
:- route_get(validation/Id/Key/Value, answer(Id, Key, Value)).
