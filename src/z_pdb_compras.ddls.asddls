@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDB_COMPRAS'

define view Z_PDB_COMPRAS 
//with parameters
// P_BUKRS : bukrs,    //CompanyCode - Sociedad
// P_GJAHR : gjahr,    //FiscalYear - Año de fecha contable
// P_DOC   : char10    //ACCOUNTINGDOCUMENT - Nro de documento
as select from I_JournalEntryItem
{
    key AccountingDocument,
        InvoiceReference,
        InvoiceReferenceFiscalYear,
        Ledger,
        FiscalYear,
        //PDB INTERNACIONAL
        AssignmentReference,
        substring(AssignmentReference, 1 , 10 ) as docref,
        substring(AssignmentReference, 12 , 15 ) as docanio
        
}
where 
    I_JournalEntryItem.Ledger = '0L'
and I_JournalEntryItem.FinancialAccountType = 'K'
//and I_JournalEntryItem.CompanyCode = $parameters.P_BUKRS
//and I_JournalEntryItem.FiscalYear = $parameters.P_GJAHR
//and I_JournalEntryItem.AccountingDocument = $parameters.P_DOC
