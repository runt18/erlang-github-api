%%
%%Copyright (c) <2011>, Kuleshov Alexander <kuleshovmail@gmail.com>
%%All rights reserved.
%%
-module(messages).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([make_gist_comment_message/1]).
-export([make_add_email_message/1]).
-export([make_create_gist_message/4]).
-export([make_blob_message/2]).
-export([make_ref_message/2]).

%%
%% API Functions
%%

%%
%% @spec make_gist_comment_message(Message) -> Json
%% @doc  - Make json message
%% @type - Message = String()
%% @type - Json = String()
%% @type - error = atom()
%%
make_gist_comment_message([]) ->
	error;
make_gist_comment_message(Message) ->
	"{ \"body\":\"" ++ Message ++ "\"}".

%%
%% @spec make_create_gist_message(Description, Public, File, Content) -> Json
%% @doc  - Make json message to create new gist
%% @type - Description = String()
%% @type - Public = atom()
%% @type - File = String()
%% @type - Content = String()
%% @type - Json = String()
%% @type - error = atom()
%%
make_create_gist_message(_, [], _, _) ->
	error;
make_create_gist_message(_, _, [], _) ->
	error;
make_create_gist_message(_, _, _, []) ->
	error;
make_create_gist_message(Description, Public, File, Content) ->
    "{ \"description\":" ++ "\"" ++ Description ++ "\"," ++
        "\"public\":" ++ atom_to_list(Public) ++ "," ++ 
        "\"files\": {" ++ "\"" ++ File ++ "\"" ++ ": {" ++ 
              "\"content\":" ++  "\"" ++ Content ++ "\""  ++
           "} 
        } 
    }".

%%
%% @spec make_add_email_message(Mail) -> Json
%% @doc  - Make json message to add new user email
%% @type - Mail = String()
%% @type - Json = String()
%% @type - error = atom()
%%
make_add_email_message([]) ->
	error;
make_add_email_message(Mail) ->
	"[" ++ Mail ++ "]".

%%
%% @spec make_blob_message(Content, Encoding) -> Json
%% @doc  - Create new blob
%% @type - Content = String()
%% @type - Encoding = String()
%% @type - Json = String()
%% @type - error = atom()
%%
make_blob_message([], _) ->
	error;
make_blob_message(_, []) ->
	error;
make_blob_message(Content, Encoding) ->
	"{" ++ "\"content\":" ++ "\"" ++ Content ++ "\"," ++ 
		   "\"encoding\":" ++ "\"" ++ Encoding ++ "\"}".

%%
%% @spec make_ref_message(Ref, Sha) -> Json
%% @doc  - Create new ref
%% @type - Ref = String()
%% @type - Sha = String()
%% @type - Json = String()
%% @type - error = atom()
%%
make_ref_message([], _) ->
	error;
make_ref_message(_, []) ->
	error;
make_ref_message(Ref, Sha) ->
	"{" ++ "\"ref\":" ++ "\"" ++ Ref ++ "\"," ++ 
		   "\"sha\":" ++ "\"" ++ Sha ++ "\"}".