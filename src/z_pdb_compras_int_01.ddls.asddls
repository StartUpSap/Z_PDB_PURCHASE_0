@AbapCatalog.sqlViewName: 'ZPDB_INTER_01'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Docs 91 v2'
@Metadata.ignorePropagatedAnnotations: true
define view Z_PDB_COMPRAS_INT_01 
with parameters
 P_NRPDOC : belnr_d,         //ACCOUNTINGDOCUMENT - Nro de documento
 P_GJAHR  : gjahr            //FiscalYear - Año de fecha contable


as select from I_JournalEntry as Journalentry
inner join Z_PDB_COMPRAS as PDBCOMPRAS
on PDBCOMPRAS.docref = Journalentry.AccountingDocument
and PDBCOMPRAS.docanio = Journalentry.FiscalYear

{
    key Journalentry.DocumentReferenceID,
        Journalentry.DocumentDate,
        
        ////
        substring(Journalentry.DocumentReferenceID, 1 , 2 ) as TipoComp,
        substring(Journalentry.DocumentReferenceID, 4 , 4 ) as SerieComp,
        substring(Journalentry.DocumentReferenceID, 9 , 16 ) as NumComp
          
}

where
//    PDBCOMPRAS.docanio         = $parameters.P_GJAHR
//and PDBCOMPRAS.docref          = $parameters.P_NRPDOC
    Journalentry.FiscalYear          = $parameters.P_GJAHR
and Journalentry.AccountingDocument  = $parameters.P_NRPDOC
