@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS_14'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cod Des Int'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_14
as select from I_JournalEntryItem as JournalEntry
{
    key 
    AccountingDocument,
    CompanyCode,
    FiscalYear,
    TaxCode,
    //FinancialAccountType
    
    case
          when JournalEntry.TaxCode  = 'C0'
               then '2'
          when JournalEntry.TaxCode  = 'C1'
               then '2'
          when JournalEntry.TaxCode  = 'C2'
               then '2'     
          when JournalEntry.TaxCode  = 'C3'
               then '2'
          when JournalEntry.TaxCode  = 'CE'
               then '2'
          when JournalEntry.TaxCode  = 'C4'
               then '2'    
          else 'XX'
    end as CodDestInt
    }
    
where
        JournalEntry.Ledger = '0L'    
    and JournalEntry.FinancialAccountType = 'K'
