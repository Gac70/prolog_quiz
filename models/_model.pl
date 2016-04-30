:- module('models/_model', [json_to_dict/2]).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).

json_to_dict(FilePath, Dict) :-
    open(FilePath,read,Str),
    json_read_dict(Str,Dict),
    close(Str).
