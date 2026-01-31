@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Odata para Columna 19_3'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_PDB_COMPRAS_06_3 
with parameters 
    //P_Product : matnr,
 //P_NRPDOC : belnr_d, //abap.char(10),          //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr,           //FiscalYear - Año de fecha contable
 P_BUKRS  : bukrs            //CompanyCode - Sociedad
as select from Z_PDB_COMPRAS_05_3
{
    key TaxCode,
    AccountingDocument,
    FiscalYear,
    CompanyCodeCurrency,
    @Aggregation.default: #SUM
    @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
    MontoPositivo,
    CodigoDestino
}
where
    //Z_PDB_COMPRAS_05.AccountingDocument  = $parameters.P_NRPDOC and 
    Z_PDB_COMPRAS_05_3.CompanyCode         = $parameters.P_BUKRS
and Z_PDB_COMPRAS_05_3.FiscalYear          = $parameters.P_GJAHR
