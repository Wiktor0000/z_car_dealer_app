@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_CAR_SERVICE'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CAR_SERVICE 
    as projection on ZR_CAR_SERVICE
{
    key ServiceId,
    CarId,
    ServiceDate,
    Mileage,
    Description,
    @Semantics.amount.currencyCode : 'Currency'
    Cost,
    @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
    Currency,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    LocalLastChanged,
    _CarMaster : redirected to parent ZC_CAR_MASTER
}
