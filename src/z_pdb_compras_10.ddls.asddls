@AbapCatalog.sqlViewName: 'ZCOMPRAS_10'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Datos'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_10 
with parameters
 //P_DOC   : belnr_d, //abap.char(10),    //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr           //FiscalYear - Año de fecha contable
as select from Z_PDB_COMPRAS_09
{
    key AccountingDocument,
    Supplier,
    TaxNumberType,
    SupplierFullName,
    BusinessPartnerName1,    
    BusinessPartnerName2,    
    TaxNumber1,
    Ledger,
    FinancialAccountType,
    FiscalYear
}

where
     Z_PDB_COMPRAS_09.Ledger = '0L'
 and Z_PDB_COMPRAS_09.FinancialAccountType = 'K'
 and Z_PDB_COMPRAS_09.FiscalYear = $parameters.P_GJAHR
 //and Z_PDB_COMPRAS_09.AccountingDocument = $parameters.P_DOC
