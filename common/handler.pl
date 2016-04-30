:- module('common/handler', [server_handler/1, assets_handler/1, model_handler/1]).
:- use_module(library(http/http_dispatch)).
:- use_module(library(arouter)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).


% Manipuladores
server_handler(Request) :- (route(Request) ; http_dispatch(Request)).
assets_handler(Request) :- memberchk(path(Path),Request),
	                       http_reply_file(web_root(Path),[],Request).
model_handler(Request) :- memberchk(path(Path),Request),
							atom_concat('quiz/', Path, FilePath),
							open(FilePath, read, Str),
							json_read(Str, Term),
	                       	reply_json(Term).

% Rotas para arquivos estáticos
:- http_handler('/js', assets_handler, [prefix]).
:- http_handler('/css', assets_handler, [prefix]).
:- http_handler('/img', assets_handler, [prefix]).
:- http_handler('/fonts', assets_handler, [prefix]).
% Rotas para model
:- http_handler('/models', model_handler, [prefix]).







%FIXME uso do root para o open model_handler/1
