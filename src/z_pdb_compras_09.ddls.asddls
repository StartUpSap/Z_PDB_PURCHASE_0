@AbapCatalog.sqlViewName: 'Z_COMPRAS_09'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Busqueda_3'
@Metadata.ignorePropagatedAnnotations: true


define view Z_PDB_COMPRAS_09
as select from  I_JournalEntryItem as JournalEntryItem
inner join I_Supplier as Supplier
on Supplier.Supplier = JournalEntryItem.Supplier

{
    key 
    JournalEntryItem.AccountingDocument,
    Supplier.Supplier,
    Supplier.TaxNumberType,
    Supplier.TaxNumber1,
    JournalEntryItem.Ledger,
    JournalEntryItem.FinancialAccountType,
    JournalEntryItem.FiscalYear
}
