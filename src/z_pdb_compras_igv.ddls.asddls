@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Odata para Tipo 46 IGV'
@Metadata.ignorePropagatedAnnotations: true
@AbapCatalog.sqlViewName: 'ZPDB_IGV'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true


define view Z_PDB_COMPRAS_IGV
with parameters
    P_GJAHR  : gjahr
as select from I_JournalEntryItem 
{
    key AccountingDocument,
    key FiscalYear,
        //InvoiceReference,
        //InvoiceReferenceFiscalYear,
        Ledger,
        //AssignmentReference,
        //substring(AssignmentReference, 1 , 10 ) as documentoreferencia,
        //substring(AssignmentReference, 12 , 15 ) as anio,
        AmountInCompanyCodeCurrency,
        abs( AmountInCompanyCodeCurrency ) as MonIGV,
        abs( AmountInBalanceTransacCrcy ) as MonPos,
        GLAccount
}
where 
    I_JournalEntryItem.Ledger = '0L'
and I_JournalEntryItem.FinancialAccountType = 'K'
and ( I_JournalEntryItem.GLAccount = '0042121020' or I_JournalEntryItem.GLAccount = '0046991020' )
and FiscalYear          = $parameters.P_GJAHR
//and Journalentry.AccountingDocument  = $parameters.P_NRPDOC
