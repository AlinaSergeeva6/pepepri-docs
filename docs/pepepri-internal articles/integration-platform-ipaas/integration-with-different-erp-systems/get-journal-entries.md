---
title: "Get Journal Entries"
order: 180
---
# Get Journal Entries

In order to start working with SAP ByDesign and receive journal entries, read General overview on SAP ByDesign [here](/integration-platform-ipaas/integration-with-different-erp-systems/sap-bydesign.md) and get familiar with this documentation:

!!!success
**General Overview:** [https://help.sap.com/doc/a2b4c7ef61d64397b2b1d052082a8a08/2108/en-US/PSM\_ISI\_R\_II\_QUERY\_JOURNAL\_ENTRY\_IN.html](https://help.sap.com/doc/a2b4c7ef61d64397b2b1d052082a8a08/2108/en-US/PSM_ISI_R_II_QUERY_JOURNAL_ENTRY_IN.html)
!!!

!!!info
URL can be found in "Service Explorer" tab, after clicking on the api service that you need. How to find "Service Explorer" and available services is described [here](/integration-platform-ipaas/integration-with-different-erp-systems/how-to-download-wsdl-file.md).
!!!

### Example:

**basic structure:**

```
  GET https://{Your Company ID}.sapbydesign.com/{route}
```

!!!danger
Important: Authorization: basic auth.
!!!

```
// Headers example
Content-Type:text/xml
charset: utf-8
SOAPAction:http://sap.com/xi/A1S/Global/QueryJournalEntryIn/FindByElementsRequest
```

```
// Body Example
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:glob="http://sap.com/xi/SAPGlobal20/Global">
<soapenv:Header/>
<soapenv:Body>
<glob:JournalEntryByElementsQuery>
  <JournalEntrySelectionByElements>
    <SelectionByOriginalEntryDocumentObjectReferenceObjectTypeCode>
      <InclusionExclusionCode>I</InclusionExclusionCode>
      <IntervalBoundaryTypeCode>1</IntervalBoundaryTypeCode>
      <LowerBoundaryCode>37</LowerBoundaryCode>
    </SelectionByOriginalEntryDocumentObjectReferenceObjectTypeCode>
    <SelectionByOriginalEntryDocumentContainingObjectReferenceFormattedID>
      <InclusionExclusionCode>I</InclusionExclusionCode>
      <IntervalBoundaryTypeCode>1</IntervalBoundaryTypeCode>
      <LowerBoundaryIdentifier>681</LowerBoundaryIdentifier>
    </SelectionByOriginalEntryDocumentContainingObjectReferenceFormattedID>
  </JournalEntrySelectionByElements>
</glob:JournalEntryByElementsQuery>
</soapenv:Body>
</soapenv:Envelope>
```
