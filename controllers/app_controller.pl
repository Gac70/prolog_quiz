:- module('controllers/app_controller', [index/0, answer/3]).
:- use_module(library(st/st_render)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_json)).
:- use_module(library(http/html_write)).
:- use_module('../models/app_model').

index() :-
    json_to_dict('prolog_quiz/models/perguntas.json', Perguntas),
    json_to_dict('prolog_quiz/models/estados.json', Estados),

    format('Content-Type: text/html; charset=UTF-8~n~n'),
    current_output(Out),
    st_render_file('prolog_quiz/web/index', _{
            title: 'Quiz de Geografia',
            perguntas: Perguntas,
            estados: Estados
        }, Out, _{ frontend: semblance }
    )
.

answer(Id, Key, Value) :-
    json_to_dict('prolog_quiz/models/estados.json', Estados),
    member(Dict, Estados),

    atom_string(Id, Id_s), atom_string(Value, Value_s),
    select_dict(_{}.put([id=Id_s, Key=Value_s]), Dict, _),

    format('Content-Type: text/html; charset=UTF-8~n~n'),
    format('true')
.
