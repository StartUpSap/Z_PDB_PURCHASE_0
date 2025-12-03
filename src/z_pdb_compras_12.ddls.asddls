@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS12'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'V1'
@Metadata.ignorePropagatedAnnotations: true

define view Z_PDB_COMPRAS_12

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
and   I_JournalEntryItem.FinancialAccountType = 'K'
and   I_JournalEntryItem.GLAccount            = '0042121020'
