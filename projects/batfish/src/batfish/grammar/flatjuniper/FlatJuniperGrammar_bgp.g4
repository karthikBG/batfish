parser grammar FlatJuniperGrammar_bgp;

import FlatJuniperGrammarCommonParser;

options {
   tokenVocab = FlatJuniperGrammarLexer;
}

bfi6t_null
:
   LABELED_UNICAST ~NEWLINE*
;

bfi6t_unicast
:
   UNICAST bfi6t_unicast_tail
;

bfi6t_unicast_tail
:
//intentional blank

   | bfi6ut_prefix_limit
;

bfi6ut_prefix_limit
:
   PREFIX_LIMIT ~NEWLINE*
;

bfit_flow
:
   FLOW ~NEWLINE*
;

bfit_unicast
:
   UNICAST bfit_unicast_tail
;

bfit_unicast_tail
:
//intentional blank

   | bfiut_prefix_limit
;

bfiut_prefix_limit
:
   PREFIX_LIMIT ~NEWLINE*
;

bft_inet
:
   INET bft_inet_tail
;

bft_inet_tail
:
   bfit_flow
   | bfit_unicast
;

bft_inet6
:
   INET6 bft_inet6_tail
;

bft_inet6_tail
:
   bfi6t_null
   | bfi6t_unicast
;

bft_null
:
   INET_VPN ~NEWLINE*
;

bt_advertise_inactive
:
   ADVERTISE_INACTIVE
;

bt_cluster
:
   CLUSTER IP_ADDRESS
;

bt_common
:
   bt_advertise_inactive
   | bt_cluster
   | bt_description
   | bt_export
   | bt_family
   | bt_import
   | bt_local_address
   | bt_local_as
   | bt_multipath
   | bt_null
   | bt_path_selection
   | bt_peer_as
   | bt_remove_private
   | bt_type
;

bt_description
:
   s_description
;

bt_export
:
   EXPORT policy_expression
;

bt_family
:
   FAMILY bt_family_tail
;

bt_family_tail
:
   bft_inet
   | bft_inet6
   | bft_null
;

bt_group
:
   bt_group_header bt_group_tail
;

bt_group_header
:
   GROUP name = VARIABLE
;

bt_group_tail
:
   bt_common
   | bt_neighbor
;

bt_import
:
   IMPORT policy_expression
;

bt_local_address
:
   LOCAL_ADDRESS
   (
      IP_ADDRESS
      | IPV6_ADDRESS
   )
;

bt_local_as
:
   LOCAL_AS as = DEC
;

bt_multipath
:
   MULTIPATH MULTIPLE_AS?
;

bt_neighbor
:
   bt_neighbor_header bt_neighbor_tail
;

bt_neighbor_header
:
   NEIGHBOR
   (
      IP_ADDRESS
      | IPV6_ADDRESS
   )
;

bt_neighbor_tail
:
// intentional blank

   | bt_common
;

bt_null
:
   (
      AUTHENTICATION_KEY
      | BFD_LIVENESS_DETECTION
      | LOG_UPDOWN
      | TRACEOPTIONS
   ) ~NEWLINE*
;

bt_path_selection
:
   PATH_SELECTION bt_path_selection_tail
;

bt_path_selection_tail
:
   pst_always_compare_med
;

bt_peer_as
:
   PEER_AS as = DEC
;

bt_remove_private
:
   'remove-private'
;

bt_type
:
   TYPE
   (
      EXTERNAL
      | INTERNAL
   )
;

pe_conjunction
:
   OPEN_PAREN policy_expression DOUBLE_AMPERSAND policy_expression CLOSE_PAREN
;

pe_disjunction
:
   OPEN_PAREN policy_expression DOUBLE_PIPE policy_expression CLOSE_PAREN
;

pe_nested
:
   OPEN_PAREN policy_expression CLOSE_PAREN
;

policy_expression
:
   pe_conjunction
   | pe_disjunction
   | pe_nested
   | VARIABLE
;

pst_always_compare_med
:
   ALWAYS_COMPARE_MED
;

s_protocols_bgp
:
   BGP s_protocols_bgp_tail
;

s_protocols_bgp_tail
:
   bt_common
   | bt_group
   | bt_neighbor
;