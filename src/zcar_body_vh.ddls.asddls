@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VH for Body Car'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define view entity ZCAR_BODY_VH 
    as select from zcar_body_t
{
    @ObjectModel.text.element: ['body_text']
    @UI.textArrangement: #TEXT_ONLY
    key body_code,
    @Semantics.text: true
    body_text
}
