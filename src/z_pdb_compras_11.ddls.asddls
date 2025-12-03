@AbapCatalog.sqlViewName: 'ZPDB_COMPRAS11'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Docs 97-98'
@Metadata.ignorePropagatedAnnotations: true

define view Z_PDB_COMPRAS_11  with parameters
 P_DOC   : belnr_d, //abap.char(10),    //ACCOUNTINGDOCUMENT - Nro de documento
 //P_BUKRS : bukrs,     //CompanyCode - Sociedad
 P_GJAHR : gjahr      //FiscalYear - Año de fecha contable

as select from I_JournalEntryItem as Journal1     //Z_PDB_COMPRAS_13
inner join I_JournalEntryItem as Journal2         //Z_PDB_COMPRAS_12
on Journal2.AccountingDocument = Journal1.InvoiceReference
and Journal2.FiscalYear = Journal1.InvoiceReferenceFiscalYear
and Journal2.Ledger = Journal1.Ledger
//and Journal2.FinancialAccountType = Journal1.FinancialAccountType
//
{
    key Journal1.AccountingDocument,         //Nro de documento
    key Journal1.LedgerGLLineItem,
        Journal1.InvoiceReference,           //Doc Referencia
        Journal2.LedgerGLLineItem as RefLineItem,
        Journal1.FiscalYear,                 //Año
        Journal1.CompanyCode,                //Sociedad
        Journal1.InvoiceReferenceFiscalYear, 
        Journal1.FinancialAccountType,        // K
        Journal2.AmountInCompanyCodeCurrency,  // IGV
        Journal1.Ledger  
}

where
    Journal1.Ledger = '0L'
and Journal1.FinancialAccountType = 'K'
and Journal1.FiscalYear = $parameters.P_GJAHR
and Journal1.AccountingDocument = $parameters.P_DOC
and Journal1.InvoiceReference !=  ''
