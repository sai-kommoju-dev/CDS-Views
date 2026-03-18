*&---------------------------------------------------------------------*
*& Report zsales_header_item
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsales_header_item.
DATA : lv_vbeln TYPE vbeln_va,
       lv_posnr TYPE posnr_va.
SELECT-OPTIONS : s_vbeln FOR lv_vbeln,
                 s_posnr FOR lv_posnr.
START-OF-SELECTION.
 SELECT FROM zcds_saleshit
        FIELDs *
        WHERE vbeln IN @s_vbeln
           AND posnr IN @s_posnr
        INTO TABLE @DATA(lt_sales).
        IF sy-subrc EQ 0.

        cl_demo_output=>display( lt_sales ).
        ENDIF.
END-OF-SELECTION.
