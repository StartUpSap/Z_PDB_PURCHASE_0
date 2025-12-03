@AbapCatalog.sqlViewName: 'ZCOMPRAS08'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busqueda_2'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_08

with parameters 
 //P_NRPDOC : belnr_d, //abap.char(10),          //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr,           //FiscalYear - Año de fecha contable
 P_BUKRS  : bukrs            //CompanyCode - Sociedad

as select from Z_PDB_COMPRAS_07
{
    key AccountingDocument,
        DocumentReferenceID         //Ese es el unico dato que necesitamos
//    Ledger,
//    CompanyCode,
//    FiscalYear
}
where
    //Z_PDB_COMPRAS_07.AccountingDocument  = $parameters.P_NRPDOC and 
    Z_PDB_COMPRAS_07.CompanyCode         = $parameters.P_BUKRS
and Z_PDB_COMPRAS_07.FiscalYear          = $parameters.P_GJAHR
