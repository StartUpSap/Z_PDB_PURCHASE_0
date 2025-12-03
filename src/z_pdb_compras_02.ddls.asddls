@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDB_COMPRAS_02'

define view Z_PDB_COMPRAS_02
//with parameters
// P_NRPDOC   : char10    //ACCOUNTINGDOCUMENT - Nro de documento
// P_GLAC     : char10,    //GLAccount - Cuenta de impuesto
// P_TXCODE   : char2      //TaxCode - Indicador de impuesto
as select from I_JournalEntryItem
{
    key AccountingDocument,
    key FiscalYear,
    InvoiceReference,
    abs( AmountInCompanyCodeCurrency ) as MontoPositivo,
    //abs(AmountInCompanyCodeCurrency) as AmountInCompanyCodeCurrency2,
    CompanyCodeCurrency,
    Ledger,
    GLAccount,
    TaxCode
    
 //   sum( AmountInCompanyCodeCurrency ) as  AmountInCompanyCodeCurrency
}
where
//    I_JournalEntryItem.AccountingDocument = $parameters.P_NRPDOC
//and I_JournalEntryItem.GLAccount = $parameters.P_GLAC
//and I_JournalEntryItem.TaxCode = $parameters.P_TXCODE
 I_JournalEntryItem.Ledger = '0L'    
and I_JournalEntryItem.FinancialAccountType = 'S'
and I_JournalEntryItem.GLAccount <> '0040111010'
and ( I_JournalEntryItem.TaxCode = 'C1' or I_JournalEntryItem.TaxCode = 'C2' or
      I_JournalEntryItem.TaxCode = 'C3' or I_JournalEntryItem.TaxCode = 'C5' or
      I_JournalEntryItem.TaxCode = 'C6' or I_JournalEntryItem.TaxCode = 'C8' )
