@AbapCatalog.sqlViewName: 'ZPDBDESTINT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Codigo Destino Internacional'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_COD
with parameters 
    //P_Product : matnr,
 //P_NRPDOC : belnr_d,  //abap.char(10),          //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr,           //FiscalYear - Año de fecha contable
 P_BUKRS  : bukrs            //CompanyCode - Sociedad
as select from Z_PDB_COMPRAS_14
{
    key TaxCode,
    CodDestInt,
    AccountingDocument
}
where
    //Z_PDB_COMPRAS_14.AccountingDocument  = $parameters.P_NRPDOC and 
    Z_PDB_COMPRAS_14.CompanyCode         = $parameters.P_BUKRS
and Z_PDB_COMPRAS_14.FiscalYear          = $parameters.P_GJAHR
