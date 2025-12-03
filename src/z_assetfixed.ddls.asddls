@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PROBANDO'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_ASSETFIXED as select from I_FixedAsset
{
    key CompanyCode,
    key MasterFixedAsset,
    key FixedAsset,
    FixedAssetExternalID,
    AssetClass,
    AssetSerialNumber,
    Inventory
    }
