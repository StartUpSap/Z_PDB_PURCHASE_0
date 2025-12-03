@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS2_3'
@AbapCatalog.compiler.compareFilter: true
//@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'IGV'

define view Z_PDB_COMPRAS_03 

with parameters
//P_NRPDOC   : belnr_d, //abap.char(10),      //Nro de documento del TXT para agarrar el nro de referencia.
P_GJAHR    : gjahr                 //Año

as select from Z_PDB_COMPRAS as Journal
left outer join Z_PDB_COMPRAS_01 as Prueba                   //referencias
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
