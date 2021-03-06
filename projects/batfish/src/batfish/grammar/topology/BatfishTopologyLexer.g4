lexer grammar BatfishTopologyLexer;

options {
   superClass = 'batfish.grammar.BatfishLexer';
}

@header {
package batfish.grammar.topology;
}

HEADER
:
   'CONFIGPARSER_TOPOLOGY'
;

COLON
:
   ':'
;

COMMA
:
   ','
;

HASH
:
   '#' -> pushMode(M_COMMENT), channel(HIDDEN)
;

NEWLINE
:
   F_NewlineChar+
;

VARIABLE
:
   F_VarChar+
;

WS
:
   F_WhitespaceChar+ -> channel(HIDDEN)
;

fragment
F_NewlineChar
:
   [\n\r]
;

fragment
F_NonNewlineChar
:
   ~[\n\r]
;

fragment
F_VarChar
:
   ~[\n\r:, \t\u000C]
;

fragment
F_WhitespaceChar
:
   [ \t\u000C]
;
mode M_COMMENT;

M_COMMENT_COMMENT
:
   F_NonNewlineChar+ -> channel(HIDDEN)
;

M_COMMENT_NEWLINE
:
   F_NewlineChar+ -> type(NEWLINE), popMode
;
