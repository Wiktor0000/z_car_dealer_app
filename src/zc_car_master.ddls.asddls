@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_CAR_MASTER'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CAR_MASTER 
    provider contract transactional_query
    as projection on ZR_CAR_MASTER
{
    key CarID,
    Vin,
    Brand,
    Model,
    YearOfProduction,
    Kilometers,
    @Semantics.amount.currencyCode : 'Currency'
    Price,
    @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
    Currency,
    Note,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zcar_status_vh', element: 'status_code' }, useForValidation: true}]
    @ObjectModel.text.element: ['StatusText'] //dzięki temu widzę available, a nie samo A
    Status,
    StatusText,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zcar_body_vh', element: 'body_code' } }]
    @ObjectModel.text.element: ['BodyText']
    Body,
    BodyText,
    @Semantics.largeObject: { 
        mimeType: 'LogoMime', 
        fileName: 'LogoName', 
        contentDispositionPreference: #INLINE }
    LogoFile,
    @Semantics.mimeType: true
    LogoMime,
    LogoName,
    @Semantics.user.createdBy: true
    Createdby,
    @Semantics.systemDateTime.createdAt: true
    Createdat,
    @Semantics.user.lastChangedBy: true
    Lastchangedby,
    @Semantics.systemDateTime.lastChangedAt: true
    Lastchangedat,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    Locallastchanged,
    StatusColour
    
}
