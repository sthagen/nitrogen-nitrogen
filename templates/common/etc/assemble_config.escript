#!/usr/bin/env escript
%% -*- erlang -*-
%% vim: ts=4 sw=4 et ft=erlang
%%
%% Coyright 2020 - Jesse Gumm
%% MIT License
%%
%%
%% Usage: ./assemble_config.escript <DirectoryOfConfigFiles> <PathToNewConsolidatedConfigFile>
%%
%% Takes the a directory, loads all the .config files in it, and generates a new consolidated config file


main([ConfDir, OutFile]) ->
    Files0 = filelib:wildcard(filename:join(ConfDir,"*.config")),
    Files = Files0 -- [OutFile], %% We don't want to load our master config file
    Terms = lists:foldl(fun(F, Acc) ->
        io:format("CONFIG ASSEMBLER: Loading ~s...",[F]),
        case file:consult(F) of
            {error, {LineNo, Module, Error}} ->
                io:format("FAIL! Reason: ~s on line ~p (reported by ~p)~n",[Error, LineNo, Module]),
                halt(1);
            {error, Error} ->
                io:format("FAIL! Reason: ~p~n",[Error]),
                halt(1);
            {ok, Config} ->
                io:format("Success!~n"),
                Acc ++ Config
        end
    end, [], Files),
    Terms2 = lists:flatten(Terms),
    io:format("CONFIG ASSEMBLER: Generating ~s...",[OutFile]),
    TopComment = io_lib:format("%% This file was autogenerated with the command: ~s ~s ~s",[escript:script_name(), ConfDir, OutFile]),
    case file:write_file(OutFile, io_lib:format("~s~n~p.", [TopComment, Terms2])) of
        ok ->
            io:format("Success!~n");
        {error, Error} ->
            io:format("FAIL! Reason: ~p~n",[Error]),
            halt(1)
    end.