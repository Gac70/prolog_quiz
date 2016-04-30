:- module(server, []).
:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(arouter)).
:- use_module('common/handler').
:- use_module('controllers/default').

% Definindo a raiz do backend e frontend
user:file_search_path(root, 'quiz').
user:file_search_path(web_root, 'quiz/web').

% Inicialização do servidor
server(Port) :- http_server(server_handler, [port(Port)]).

% Rotas
:- route_get(/, default_index()).
:- route_get(validation/Id/Key/Value, default_answer(Id, Key, Value)).
