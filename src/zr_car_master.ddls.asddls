@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZCAR_MASTER'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZR_CAR_MASTER 
as select from zcar_master as Car
left outer join zcar_status_t as StatusText
    on Car.status = StatusText.status_code
left outer join zcar_body_t as BodyText
    on Car.body = BodyText.body_code
{
    
    key Car.car_id as CarID,
    Car.vin as Vin,
    Car.brand as Brand,
    Car.model as Model,
    Car.year_of_production as YearOfProduction,
    Car.kilometers as Kilometers,
    @Semantics.amount.currencyCode : 'Currency'
    Car.price as Price,
    @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
    Car.currency as Currency,
    Car.note as Note,
    Car.status as Status,
    StatusText.status_text as StatusText,
    Car.body as Body,
    BodyText.body_text as BodyText,
    @Semantics.largeObject: { 
        mimeType: 'LogoMime', 
        fileName: 'LogoName', 
        contentDispositionPreference: #INLINE }
    Car.logo_file as LogoFile,
    @Semantics.mimeType: true
    Car.logo_mime as LogoMime,
    Car.logo_name as LogoName,
    Car.dealer_notes as DealerNotes, 
    @Semantics.user.createdBy: true
    Car.createdby as Createdby,
    Car.createdat as Createdat,
    @Semantics.user.lastChangedBy: true
    Car.lastchangedby as Lastchangedby,
    @Semantics.systemDateTime.lastChangedAt: true
    Car.lastchangedat as Lastchangedat,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    Car.locallastchanged as Locallastchanged,
    
    //dodanie kolorow do statusow
    case Car.status
        when 'A' then 3 //zielony
        when 'S' then 1 //czerwony
        when 'R' then 2 //zolty
        else 0
        end as StatusColour
}
