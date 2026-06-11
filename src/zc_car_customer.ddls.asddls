@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Car Catalog for Customers'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZC_CAR_CUSTOMER
    provider contract transactional_query
    as projection on ZR_CAR_MASTER
{
    key CarID,
    Brand,
    Model,
    YearOfProduction,
    Kilometers,
    @Semantics.amount.currencyCode : 'Currency'
    Price,
    Currency,
    @Semantics.largeObject: { 
        mimeType: 'LogoMime', 
        fileName: 'LogoName', 
    contentDispositionPreference: #INLINE }
    LogoFile,
    @Semantics.mimeType: true
    LogoMime,
    LogoName,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zcar_status_vh', element: 'status_code' }, useForValidation: true}]
    @ObjectModel.text.element: ['StatusText']
    @UI.textArrangement: #TEXT_ONLY
    StatusText,
    @Consumption.valueHelpDefinition: [{ entity: { name: 'zcar_body_vh', element: 'body_code' } }]
    @ObjectModel.text.element: ['BodyText']
    @UI.textArrangement: #TEXT_ONLY
    BodyText,
    StatusColour,
    _CarImages : redirected to ZC_CAR_IMAGES

}
