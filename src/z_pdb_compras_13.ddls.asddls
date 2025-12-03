@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS_13'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'V2'
@Metadata.ignorePropagatedAnnotations: true

define view Z_PDB_COMPRAS_13 

with parameters
//P_NRPDOC   : belnr_d, //abap.char(10),      //Nro de documento del TXT para agarrar el nro de referencia.
P_GJAHR    : gjahr                 //Año

as select from Z_PDB_COMPRAS as Journal
inner join Z_PDB_COMPRAS_12 as Prueba                   //referencias
on  Prueba.AccountingDocument = Journal.InvoiceReference
and Prueba.Ledger = Journal.Ledger
and Prueba.FiscalYear = Journal.InvoiceReferenceFiscalYear

{
    key Prueba.AccountingDocument,
        Journal.AccountingDocument as Documento,
        Prueba.FinancialAccountType,
        Prueba.GLAccount,
        //Prueba.AmountInCompanyCodeCurrency,
        
        sum( Prueba.MontoPositivo ) as Total  // Total de la suma del IGV
}
where
    Journal.Ledger                      = '0L'
//and Journal.FinancialAccountType        = 'S'
and Journal.FiscalYear                  = $parameters.P_GJAHR
//and Journal.AccountingDocument          = $parameters.P_NRPDOC
//and Prueba.GLAccount                   = '0040111010'
//and Prueba.TaxCode                     = 'C1'

group by Prueba.AccountingDocument, Journal.AccountingDocument, Prueba.GLAccount, Prueba.FinancialAccountType
