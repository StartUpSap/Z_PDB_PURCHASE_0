@AbapCatalog.sqlViewName: 'ZPDB_INTER_02'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Docs 91 v3'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_INT_02 
with parameters
 //P_NRPDOC   : belnr_d,    // abap.char(10),    //ACCOUNTINGDOCUMENT - Nro de documento
 P_ANIO     : gjahr       //Año
as select from Z_PDB_COMPRAS as Journal
inner join Z_PDB_COMPRAS_INT as Prueba
on  Prueba.AccountingDocument = Journal.docref
and Prueba.Ledger = Journal.Ledger
and Prueba.FiscalYear = Journal.docanio

{
    key Journal.docref,
    key Journal.docanio,
    Prueba.MonPos
}

where
    //Journal.AccountingDocument = $parameters.P_NRPDOC and 
    Journal.FiscalYear = $parameters.P_ANIO
and Journal.Ledger = '0L'    
//and Z_PDB_COMPRAS_02.GLAccount <> '0040111010'
//and Z_PDB_COMPRAS_02.TaxCode = 'C1'
//group by Journal.AccountingDocument, Journal.InvoiceReference
