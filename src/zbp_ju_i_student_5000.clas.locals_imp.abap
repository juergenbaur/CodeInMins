CLASS lhc_zju_i_student_5000 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR Student RESULT result.
    METHODS setadmitted FOR MODIFY
      IMPORTING keys FOR ACTION student~setadmitted RESULT result.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR student RESULT result.

ENDCLASS.

CLASS lhc_zju_i_student_5000 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD setAdmitted.

    MODIFY ENTITIES OF zju_i_student_5000 IN LOCAL MODE
    ENTITY Student
    UPDATE
    FIELDS ( Status )
    WITH VALUE #( FOR key IN keys ( %tky = key-%tky Status = abap_true ) )
    FAILED failed
    REPORTED reported.

    "Get the response updated record
    READ ENTITIES OF zju_i_student_5000 IN LOCAL MODE
    ENTITY Student
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(studentdata).

    result = value #( for studentrec in studentdata
    (  %tky = studentrec-%tky %param = studentrec ) ).

  ENDMETHOD.

  METHOD get_instance_features.
  ENDMETHOD.

ENDCLASS.
