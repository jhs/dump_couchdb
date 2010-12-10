%% Module to serve raw couch files

-module(dump_couchdb).
-author('Jason Smith <jhs@couchone.com>').

-export([handle_dump_req/2]).

-include("couch_db.hrl").

handle_dump_req(#httpd{method='GET'}=Req, Db)
    -> ?LOG_DEBUG("Received dump request: ~p", [Req])
    , ok = couch_httpd:verify_is_server_admin(Req)
    , couch_httpd:send_json(Req, 200, {[{ok, true}, {<<"not implemented">>, <<"also true">>}]})
    ;

handle_dump_req(Req, _Db)
    -> couch_httpd:send_method_not_allowed(Req, "GET")
    .

% vim: sw=4 sts=4 et
