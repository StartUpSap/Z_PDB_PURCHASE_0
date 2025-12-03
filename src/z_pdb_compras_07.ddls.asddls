@AbapCatalog.sqlViewName: 'ZCOMPRAS07'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busqueda 1'
define view Z_PDB_COMPRAS_07
as select from I_JournalEntry //as JournalEntryItem
//inner join I_Supplier as supplier
//on supplier.Supplier = JournalEntryItem.Customer
//on JournalEntryItem.Customer = supplier.Supplier
{
    key 
    AccountingDocument,
    DocumentReferenceID,
    Ledger,
//    Supplier,
    CompanyCode,
    FiscalYear
//    TaxCode,
//    CustomerAccountGroup
//    FinancialAccountType

}
//where
//        Ledger = '0L'    
//    and FinancialAccountType = 'K'
