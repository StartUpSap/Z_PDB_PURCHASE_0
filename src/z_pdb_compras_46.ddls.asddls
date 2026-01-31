@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Odata para Tipo 46'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_PDB_COMPRAS_46 
with parameters 
    //P_Product : matnr,
 //P_NRPDOC : belnr_d, //abap.char(10),          //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr           //FiscalYear - Año de fecha contable
as select from I_JournalEntry as Journal
join I_JournalEntryItem as Item
on Journal.AccountingDocument = Item.AccountingDocument
and Journal.FiscalYear = Item.FiscalYear
and Item.LedgerGLLineItem = '000001'
//and Item.AssignmentReference <>''
{
    key Journal.CompanyCode,
    key Journal.AccountingDocument,
    Item.LedgerGLLineItem,
    Item.Ledger,
    Journal.DocumentDate,
    Journal.DocumentReferenceID,
    Item.AssignmentReference
}
where
 Item.FiscalYear          = $parameters.P_GJAHR
 and Item.Ledger = '0L'

