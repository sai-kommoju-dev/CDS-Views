@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales order header and item details'
@Metadata.ignorePropagatedAnnotations: true
define view entity zcds_saleshit as select from vbak
 association [1..*] to vbap as _item
 on vbak.vbeln = _item.vbeln
{
vbeln,
vkorg,
_item.posnr,
_item.matnr,
@Semantics.quantity.unitOfMeasure: 'ZIEME'
_item.kwmeng,
_item.zieme
}
