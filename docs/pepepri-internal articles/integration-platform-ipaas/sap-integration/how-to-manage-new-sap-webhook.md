---
title: "How to manage new SAP Webhook"
description: "Source of templates is on Integration Examples, webhook SAP - Import XML Sales Order"
order: 151
---
# How to manage new SAP Webhook

*Source of templates is on Integration Examples, webhook SAP - Import XML Sales Order*

**REMARKS** AIM of preparing the new SAP Webhook: avoid the necessity of lines declaration which influences on webhook settings and behaviour

**PAY ATTENTION to make this new SAP Webhook work, SAP listener must be upgraded to the new version** otherwise it won't work

## #1 Step: prepare the webhook

Description: SAP - Import XML Sales Order (any appropriate name) **Application:** SAP Desktop Plugin **Source Object:** Pepperi Transaction Webhook **Target Object:** SAP B1 Desktop Import Order Header

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-21-at-10.29.44.png)

### #2 Step: prepare Settings of the webhook

**trn\_status** regular **listener\_run\_exe** sap\_importer.exe **is\_new\_api** \*checked **is\_edit\_allowed** \*checked **lock\_online\_trn** \*not checked **is\_debug\_dataset** \*checked **response\_id\_sql** 'SELECT DocNum As RefNum, DocTotal , VatSum, VatPercent FROM ORDR WHERE DocEntry={#DocEntry#}’ **transaction\_text\_for\_parsing** HTML/Script content. Click Edit or Editor to view and edit. \*add xml file with all necessary lines

**is\_debug\_sap\_xml** \*checked

**PAY ATTENTION:** \- if you want to get through all these settings, check out [https://kbint.pepperi.com/test-settings-configuration](https://kbint.pepperi.com/test-settings-configuration)

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-21-at-10.41.17.png)

### #3 Step: prepare xml file with necessary fields

![](https://alinasergeeva6.github.io/pepepri-docs/static/Screenshot-2021-09-21-at-10.44.26.png)

**Example:**

```
<?xml version="1.0" encoding="UTF-16"?>
<BOM>
    <BO>
        <AdmInfo>
            <Object>17</Object>
            <Version>2</Version>
        </AdmInfo>
        <Documents>
            <row>
                <DocType>dDocument_Items</DocType>
                <HandWritten>tNO</HandWritten>
                <Printed>psNo</Printed>
                <DocDate>$#ActionDateTime#$</DocDate>
                <DocDueDate>$#ActionDateTime#$</DocDueDate>
                <CardCode>$#AccountExternalID#$</CardCode>
                <NumAtCard>Pep-$#InternalID#$</NumAtCard>
                <Confirmed>tYES</Confirmed>
                <SummeryType>dNoSummary</SummeryType>
                <ShowSCN>tNO</ShowSCN>
                <DocObjectCode>17</DocObjectCode>
                <RevisionPo>tNO</RevisionPo>
                <BlockDunning>tNO</BlockDunning>
                <Pick>tNO</Pick>
                <PaymentBlock>tNO</PaymentBlock>
                <MaximumCashDiscount>tNO</MaximumCashDiscount>
                <WareHouseUpdateType>dwh_CustomerOrders</WareHouseUpdateType>
                <Rounding>tNO</Rounding>
                <DocumentSubType>bod_None</DocumentSubType>
                <ReserveInvoice>tNO</ReserveInvoice>
                <SequenceModel>0</SequenceModel>
                <UseCorrectionVATGroup>tNO</UseCorrectionVATGroup>
                <DownPaymentType>dptInvoice</DownPaymentType>
                <InsuranceOperation347>tNO</InsuranceOperation347>
                <ArchiveNonremovableSalesQuotation>tNO</ArchiveNonremovableSalesQuotation>
                <CashDiscountDateOffset>0</CashDiscountDateOffset>
                <NTSApproved>tNO</NTSApproved>
                <EDocGenerationType>edocNotRelevant</EDocGenerationType>
                <EDocStatus>edoc_Ok</EDocStatus>
                <GroupHandWritten>tNO</GroupHandWritten>
                <CreateOnlineQuotation>tNO</CreateOnlineQuotation>
                <ClosingOption>coByCurrentSystemDate</ClosingOption>
                <OpenForLandedCosts>tYES</OpenForLandedCosts>
                <RelevantToGTS>tNO</RelevantToGTS>
                <IsAlteration>tNO</IsAlteration>
                <ReuseDocumentNum>tNO</ReuseDocumentNum>
                <ReuseNotaFiscalNum>tNO</ReuseNotaFiscalNum>
                <PrintSEPADirect>tNO</PrintSEPADirect>
                <InterimType>boidt_None</InterimType>
                <RelatedType>-1</RelatedType>
                <Comments>$#Remark#$</Comments>
                <U_CarrierName>$#TSACarrierName#$</U_CarrierName>
            </row>
        </Documents>
        <Document_Lines>
  @@lines
            <row>
                <ItemCode>$#ItemExternalID#$</ItemCode>
                <Quantity>$#TSACalcQty#$</Quantity>
                <U_PepperiCases>$#UnitsQuantity#$</U_PepperiCases>
                <Price>$#Price#$</Price>
                <DiscountPercent>$#DiscountPercent#$</DiscountPercent>
                <FreeText>$#TSAComments#$</FreeText>
                <WarehouseCode>$#TSAWhsCode#$</WarehouseCode>
                <FreeText>$#TSAComments#$</FreeText>
                <TreeType>iNotATree</TreeType>
                <UseBaseUnits>tNO</UseBaseUnits>
                <BaseType>-1</BaseType>
                <ShippingMethod>-1</ShippingMethod>
                <CorrectionInvoiceItem>ciis_ShouldBe</CorrectionInvoiceItem>
                <DeferredTax>tNO</DeferredTax>
                <LineStatus>bost_Open</LineStatus>
                <LineType>dlt_Regular</LineType>
                <WithoutInventoryMovement>tNO</WithoutInventoryMovement>
                <ConsiderQuantity>tNO</ConsiderQuantity>
                <PartialRetirement>tNO</PartialRetirement>
                <ThirdParty>tNO</ThirdParty>
                <UoMEntry>0</UoMEntry>
                <Incoterms>0</Incoterms>
                <TransportMode>0</TransportMode>
                <ChangeInventoryQuantityIndependently>tNO</ChangeInventoryQuantityIndependently>
                <Address>$#TSAAddress#$</Address>
            </row>

  @@lines

        </Document_Lines>
        <Document_LinesAdditionalExpenses>
            <row>
                <TaxLiable>tYES</TaxLiable>
                <TaxType></TaxType>
                <BaseGroup>-1</BaseGroup>
            </row>
        </Document_LinesAdditionalExpenses>
        <Document_SpecialLines>
            <row></row>
        </Document_SpecialLines>
    </BO>
</BOM>
```

**PAY ATTENTION:** \- the xml file should consist of the fields and lines that are appropriate for webhook’s purpose
