@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZCAR_SERVICE'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_CAR_SERVICE 
    as select from zcar_service
        association to parent ZR_CAR_MASTER as _CarMaster
        on $projection.CarId = _CarMaster.CarID
{
    key service_id as ServiceId,
    car_id as CarId,
    service_date as ServiceDate,
    mileage as Mileage,
    description as Description,
    @Semantics.amount.currencyCode : 'Currency'
    cost as Cost,
    @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
    currency as Currency,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    locallastchanged as LocalLastChanged,
    _CarMaster
}
