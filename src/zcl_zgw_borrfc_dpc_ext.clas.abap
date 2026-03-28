class ZCL_ZGW_BORRFC_DPC_EXT definition
  public
  inheriting from ZCL_ZGW_BORRFC_DPC
  create public .

public section.
protected section.

  methods SALESORDERSET_GET_ENTITYSET
    redefinition .
  methods BUSINESSPARTNERS_GET_ENTITYSET
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZGW_BORRFC_DPC_EXT IMPLEMENTATION.


METHOD businesspartners_get_entityset.
  DATA: lt_headerdata TYPE TABLE OF bapi_epm_bp_header,
        lt_return     TYPE TABLE OF bapiret2.

* Get data
  CALL FUNCTION 'BAPI_EPM_BP_GET_LIST'
    TABLES
      bpheaderdata = lt_headerdata
      return       = lt_return.

  IF lt_return IS NOT INITIAL.
    "Message Container
    mo_context->get_message_container( )->add_messages_from_bapi( lt_return ).
    RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
      EXPORTING
        textid = /iwbep/cx_mgw_busi_exception=>business_error
        message_container = mo_context->get_message_container( ).
  ENDIF.

* Map properties from the back-end to output response structure
  et_entityset = VALUE #( FOR header IN lt_headerdata
                   ( businesspartnerid   = header-bp_id
                     businesspartnerrole = header-bp_role
                     emailaddress        = header-email_address
                     companyname         = header-company_name
                     currencycode        = header-currency_code
                     city                = header-city
                     street              = header-street
                     country             = header-country
                     addresstype         = header-address_type ) ).
ENDMETHOD.


method SALESORDERSET_GET_ENTITYSET.
endmethod.
ENDCLASS.
