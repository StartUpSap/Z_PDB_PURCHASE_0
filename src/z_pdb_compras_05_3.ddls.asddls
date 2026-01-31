@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Odata para Columna 19_2'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_PDB_COMPRAS_05_3 
as select from I_JournalEntryItem as JournalEntry
{
    key 
    AccountingDocument,
    CompanyCode,
    FiscalYear,
    GLAccount,
    TaxCode,
    CompanyCodeCurrency,
    @Aggregation.default: #SUM
    @Semantics: { amount : {currencyCode: 'CompanyCodeCurrency'} }
    abs(AmountInCompanyCodeCurrency) as MontoPositivo,
    //FinancialAccountType
    
    case
          when JournalEntry.TaxCode  = 'C1'
               then '4'
          when JournalEntry.TaxCode  = 'C2'
               then '4'
          when JournalEntry.TaxCode  = 'C3'
               then '4'     
          when JournalEntry.TaxCode  = 'C4'
               then '4'
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
    and JournalEntry.GLAccount = '0040111010'
    and JournalEntry.FinancialAccountType = 'S'
