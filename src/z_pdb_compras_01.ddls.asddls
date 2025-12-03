@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDB_COMPRAS_01'

//Para ver el IGV

define view Z_PDB_COMPRAS_01 
//with parameters
// P_NRPDOC   : char10    //ACCOUNTINGDOCUMENT - Nro de documento
// P_GLAC     : char10,    //GLAccount - Cuenta de impuesto
// P_TXCODE   : char2      //TaxCode - Indicador de impuesto
as select from I_JournalEntryItem
{
    key AccountingDocument,
    key FiscalYear,
    key CompanyCode,
    InvoiceReference,
    InvoiceReferenceFiscalYear,
    FinancialAccountType,
    abs( AmountInCompanyCodeCurrency ) as MontoPositivo,
    //CompanyCodeCurrency,
    Ledger,
    GLAccount,
    TaxCode
//    GLAccount
}
where 
      I_JournalEntryItem.Ledger               = '0L'    
and   I_JournalEntryItem.FinancialAccountType = 'S'
and   I_JournalEntryItem.GLAccount            = '0040111010'
