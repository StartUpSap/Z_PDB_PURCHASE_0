@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_6'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Codigo de Destino'
define view Z_PDB_COMPRAS_06 
with parameters 
    //P_Product : matnr,
 //P_NRPDOC : belnr_d, //abap.char(10),          //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr,           //FiscalYear - Año de fecha contable
 P_BUKRS  : bukrs            //CompanyCode - Sociedad
as select from Z_PDB_COMPRAS_05
{
    key TaxCode,
    CodigoDestino,
    AccountingDocument
}
where
    //Z_PDB_COMPRAS_05.AccountingDocument  = $parameters.P_NRPDOC and 
    Z_PDB_COMPRAS_05.CompanyCode         = $parameters.P_BUKRS
and Z_PDB_COMPRAS_05.FiscalYear          = $parameters.P_GJAHR
