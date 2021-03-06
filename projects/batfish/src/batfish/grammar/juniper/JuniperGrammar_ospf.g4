parser grammar JuniperGrammar_ospf;

import JuniperGrammarCommonParser;

options {
   tokenVocab = JuniperGrammarLexer;
}

aop_stanza
:
   interface_aop_stanza
   | null_aop_stanza
;

area_op_stanza
:
   AREA
   (
      DEC
      //TODO: Juniper docs say this can be IP but representation is set for int

   ) OPEN_BRACE aop_stanza+ CLOSE_BRACE
;

export_op_stanza
:
   (
      EXPORT
      (
         name = VARIABLE
         | x = variable_list
      ) SEMICOLON
   )
;

import_op_stanza
:
   IMPORT ignored_substanza
;

interface_aop_stanza
:
   INTERFACE iname = VARIABLE ignored_substanza SEMICOLON
   // TODO [Ask Ari]: shoule we really be ignoring this?

;

network_summary_export_aop_stanza
:
   NETWORK_SUMMARY_EXPORT ignored_substanza SEMICOLON
;

null_aop_stanza
:
   network_summary_export_aop_stanza
   | nssa_aop_stanza
;

null_op_stanza
:
   import_op_stanza
   | traceoptions_op_stanza
;

nssa_aop_stanza
:
   NSSA SEMICOLON
;

op_stanza
:
   area_op_stanza
   | export_op_stanza
   | reference_bandwidth_op_stanza
   | null_op_stanza
;

ospf_p_stanza
:
   OSPF OPEN_BRACE op_stanza+ CLOSE_BRACE
;

reference_bandwidth_op_stanza
:
   REFERENCE_BANDWIDTH double_num SEMICOLON
;

traceoptions_op_stanza
:
   TRACEOPTIONS ignored_substanza
;
