CLASS zcl_customer_manager_dmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      add_customer IMPORTING iv_customer_id   TYPE z_customer_id_dmr
                             iv_customer_name TYPE z_customer_name_dmr

                   EXPORTING ev_result        TYPE sy-subrc,

      update_customer IMPORTING iv_customer_id   TYPE z_customer_id_dmr
                                iv_customer_name TYPE z_customer_name_dmr
                      EXPORTING ev_result        TYPE sy-subrc,

      delete_customer IMPORTING iv_customer_id TYPE z_customer_id_dmr
                      EXPORTING ev_result      TYPE sy-subrc.



ENDCLASS.

CLASS zcl_customer_manager_dmr IMPLEMENTATION.

  METHOD add_customer.


    DATA customer TYPE ztcustomer_dmr.

    customer-customer_id = iv_customer_id.
    customer-customer_name = iv_customer_name.

    INSERT INTO ztcustomer_dmr VALUES @customer.



    ev_result = sy-subrc.



  ENDMETHOD.

  METHOD update_customer.

    UPDATE ztcustomer_dmr SET customer_name = @iv_customer_name
      WHERE customer_id = @iv_customer_id.

    IF sy-subrc = 0.

      ev_result = 0.

    ELSE.
      ev_result = sy-subrc.
    ENDIF.
  ENDMETHOD.

  METHOD delete_customer.

    DELETE FROM ztcustomer_dmr WHERE customer_id = @iv_customer_id.
    IF sy-subrc = 0.

      ev_result = 0.

    ELSE.
      ev_result = sy-subrc.
    ENDIF.
  ENDMETHOD.




ENDCLASS.

