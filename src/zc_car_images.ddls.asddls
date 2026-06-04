@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for ZR_CAR_IMAGES'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_CAR_IMAGES 
    as projection on ZR_CAR_IMAGES
{
    key ImageId,
    CarId,
    @Semantics.largeObject: {
    mimeType: 'MimeType',
    fileName: 'FileName',
    contentDispositionPreference: #INLINE
}
    Attachment,
    MimeType,
    FileName,
    LocalLastChangedAt,
    _CarMaster : redirected to parent ZC_CAR_MASTER
}
