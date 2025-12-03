@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_4'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Base Imponible'

define view Z_PDB_COMPRAS_04 
with parameters
 //P_NRPDOC   : belnr_d,// abap.char(10),    //ACCOUNTINGDOCUMENT - Nro de documento
 P_ANIO     : gjahr      //Año
as select from Z_PDB_COMPRAS as Journal
inner join Z_PDB_COMPRAS_02 as Prueba
on  Prueba.AccountingDocument = Journal.InvoiceReference
and Prueba.Ledger = Journal.Ledger
and Prueba.FiscalYear = Journal.InvoiceReferenceFiscalYear

{
    key Journal.AccountingDocument,
    Journal.InvoiceReference,
    //sum(AmountInCompanyCodeCurrency2) * -1 as Total  //La suma de la Base Imponible
    sum( Prueba.MontoPositivo)  as Total  //La suma de la Base Imponible
}
where
    //Journal.AccountingDocument = $parameters.P_NRPDOC and 
    Journal.FiscalYear = $parameters.P_ANIO
and Journal.Ledger = '0L'    
//and Z_PDB_COMPRAS_02.GLAccount <> '0040111010'
//and Z_PDB_COMPRAS_02.TaxCode = 'C1'
group by Journal.AccountingDocument, Journal.InvoiceReference
