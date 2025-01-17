CLASS zcl_main_dmr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_main_dmr IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    DATA: lo_customer_manager TYPE REF TO zcl_customer_manager_dmr,
          lv_option           TYPE c LENGTH 1,
          lv_customer_id      TYPE z_customer_id_dmr,
          lv_customer_name    TYPE z_customer_name_dmr,
          lv_result           TYPE sy-subrc.

    CREATE OBJECT lo_customer_manager.

    out->write( '1: Add Customer' ).
    out->write( '2: Update Customer' ).
    out->write( '3: Delete Customer' ).
    out->write( '4: Display Customer' ).
    out->write( 'Select an option' ).

    lv_option = '1'.



    CASE lv_option.
      WHEN '1'.


        lv_customer_id = '0000000001'.



        lv_customer_name = 'Dani M.'.

        lo_customer_manager->add_customer( EXPORTING iv_customer_id = lv_customer_id
                                                     iv_customer_name = lv_customer_name
                                           IMPORTING ev_result = lv_result ).

        out->write( 'INSERT!' ).
        out->write( lv_result ).

      WHEN '2'.
        out->write( 'Enter Customer ID to update:' ).


      WHEN '3'.

        lv_customer_id = 'Enter Cust'.
        lo_customer_manager->delete_customer( EXPORTING iv_customer_id = lv_customer_id
                                              IMPORTING ev_result = lv_result ).

        out->write( 'DELETE!' ).
        out->write( lv_result ).

      WHEN '4'.
        lo_customer_manager->display_customers( ).

      WHEN OTHERS.
        out->write( 'Invalid option. Please try again.' ).

    ENDCASE.




  ENDMETHOD.


ENDCLASS.
