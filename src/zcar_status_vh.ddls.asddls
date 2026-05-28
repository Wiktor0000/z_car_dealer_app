@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Value Help dla statusów'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZCAR_STATUS_VH 
    as select from zcar_status_t
{
    @ObjectModel.text.element: ['status_text']
    @UI.textArrangement: #TEXT_ONLY
    key status_code,
    @Semantics.text: true
    status_text
}
