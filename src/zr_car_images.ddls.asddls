@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Zdjecia samochodow - Widok bazowy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_CAR_IMAGES 
    as select from zcar_images
        association to parent ZR_CAR_MASTER as _CarMaster on $projection.CarId = _CarMaster.CarID
{
    key image_id as ImageId,
    car_id as CarId,
@Semantics.largeObject: {
    mimeType: 'MimeType',
    fileName: 'FileName',
    contentDispositionPreference: #INLINE
}
    attachment as Attachment,
    mimetype as MimeType,
    filename as FileName,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    local_last_changed_at as LocalLastChangedAt,
    _CarMaster
    
}
