@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_5'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PDB_COMPRAS_03'
define view Z_PDB_COMPRAS_05
as select from I_JournalEntryItem as JournalEntry
{
    key 
    AccountingDocument,
    CompanyCode,
    FiscalYear,
    TaxCode,
    //FinancialAccountType
    
    case
          when JournalEntry.TaxCode  = 'C1'
               then '1'
          when JournalEntry.TaxCode  = 'C2'
               then '2'
          when JournalEntry.TaxCode  = 'C3'
               then '3'     
          when JournalEntry.TaxCode  = 'C4'
               then '2'
          when JournalEntry.TaxCode  = 'C5'
               then '5'
          when JournalEntry.TaxCode  = 'C0'
               then '4'
          when JournalEntry.TaxCode  = 'C8'
               then '1'
          
          else 'XX'
    end as CodigoDestino
    }
    
where
        JournalEntry.Ledger = '0L'    
    and JournalEntry.FinancialAccountType = 'S'
