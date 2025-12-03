@AbapCatalog.sqlViewName: 'ZPDB_INTER'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Docs 91 v1'
@Metadata.ignorePropagatedAnnotations: true

define view Z_PDB_COMPRAS_INT
//with parameters
// P_NRPDOC : belnr_d,         //ACCOUNTINGDOCUMENT - Nro de documento
// P_GJAHR  : gjahr            //FiscalYear - Año de fecha contable
//as select from I_JournalEntryItem as Journalentry
//inner join Z_PDB_COMPRAS as PDBCOMPRAS
as select from I_JournalEntryItem //Z_PDB_COMPRAS as PDBCOMPRAS
//inner join I_JournalEntryItem as Journalentry
//on PDBCOMPRAS.docref = Journalentry.AccountingDocument
//and PDBCOMPRAS.docanio = Journalentry.FiscalYear
//on Journalentry.AccountingDocument = PDBCOMPRAS.docref
//and Journalentry.FiscalYear = PDBCOMPRAS.docanio
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
        abs( AmountInBalanceTransacCrcy ) as MonPos,
        GLAccount
}
where 
    I_JournalEntryItem.Ledger = '0L'
and I_JournalEntryItem.FinancialAccountType = 'K'
and ( I_JournalEntryItem.GLAccount = '0042121020' or I_JournalEntryItem.GLAccount = '0046991020' )
//and Journalentry.FiscalYear          = $parameters.P_GJAHR
//and Journalentry.AccountingDocument  = $parameters.P_NRPDOC
