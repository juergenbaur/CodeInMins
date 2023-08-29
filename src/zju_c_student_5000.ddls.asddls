@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View Students'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity zju_c_student_5000
  provider contract transactional_query
  as projection on zju_i_student_5000 as Student
{
  key Id,
      Firstname,
      Lastname,
      Age,
      Course,
      Courseduration,
      Status,
      Gender,
      Dob,
      Lastchangedat      as Lastchangedat,
      Locallastchangedat as Locallastchangedat
}
