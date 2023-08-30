CLASS zju_cl_rap_eml DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cl_rap_eml IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA it_student TYPE TABLE FOR CREATE zju_i_student_5000.
    it_student = VALUE #( ( Firstname = 'Firstname' Lastname = 'Lastname'
                            Age = 55 Course = 'Computers' Courseduration = 5 Status = ''
                            %control = VALUE #( Firstname      = if_abap_behv=>mk-on
                                                Lastname       = if_abap_behv=>mk-on
                                                Age            = if_abap_behv=>mk-on
                                                Course         = if_abap_behv=>mk-on
                                                Courseduration = if_abap_behv=>mk-on
                                                Status         = if_abap_behv=>mk-on
                                                )
                                                ) ).
    MODIFY ENTITIES OF  zju_i_student_5000
    ENTITY Student  "from Behavior Definition
    CREATE FROM it_student
    MAPPED DATA(lt_mapped)
    FAILED DATA(lt_failed)
    REPORTED DATA(lt_reported).

    IF lt_failed IS NOT INITIAL.
      out->write(
        EXPORTING
          data   = lt_failed
          name   = 'Failed'
*  RECEIVING
*    output =
      ).
    ELSE.
      COMMIT ENTITIES.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
