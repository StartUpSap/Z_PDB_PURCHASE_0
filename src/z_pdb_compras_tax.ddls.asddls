@AbapCatalog.sqlViewName: 'ZPDBCOMPRAS_TAX'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Tax'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_TAX 

with parameters
//PAR_DOC  : belnr_d, //abap.char(10),               //Nro de documento del txt
PAR_ANIO : gjahr                 //Año

as select from I_Withholdingtaxitem
{
    key CompanyCode,
    key AccountingDocument,
    key FiscalYear,
    key AccountingDocumentItem,
    key WithholdingTaxType,
    WithholdingTaxCode
}

where FiscalYear                  = $parameters.PAR_ANIO
//and   AccountingDocument          = $parameters.PAR_DOC
