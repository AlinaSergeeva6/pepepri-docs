---
title: "Dynamic XSLT template - General"
order: 307
---
# Dynamic XSLT template - General

## Introduction

Here you will find a new dynamic template in which many client requirements are implemented. Below you will find a lot of articles with instructions how to apply different condition. This will significantly save you time in resolving a client’s request.If you have additional implementation that are not realized in this template, please write it to the e-mail: alina.s@pepperi.com.

### GLOBAL VARIABLE DECLARATION

-   **LINK TO DOC:** [**https://www.w3schools.com/xml/xsl\_intro.asp**](https://www.w3schools.com/xml/xsl_intro.asp)
-   **DECLARE VARIABLE**:

```
<xsl:variable name="NAME_VAR" select="FULL_PATH_TO_VAR" />
```

-   **APPLY**:

```
<xsl:value-of select="$NAME_VAR" />
```

-   **LOOP:**

```
<xsl:for-each select="PATH_TO_VAR">
```

-   **OPERATORS:**

```
=  (equal)
!= (not equal)
&lt; less than
&gt; greater than
```

-   **IF STATEMENT**

```
<xsl:if test="expression">
                ...some output if the expression is true...
                </xsl:if>
```

-   **IF/ELSE STATEMENT**

```
<xsl:choose><xsl:when test="expression">
                  ... some output ...
                </xsl:when><xsl:otherwise>
                  ... some output ....
                </xsl:otherwise></xsl:choose>
```

-   **REMARK**:

```
@X - DEFINE THE COLUMN
@y - DEFINE THE ROW
@ApiName - Name of the field in Backoffice
@Type - type of the field
```

Here you can find template. In the code we have a lot of comments, that will be described in the next articles by categories.

53KB

[DynamicTemplateV\_1.xslt](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MB3R-1BxdiuYwLajU3w%2F-MB3Uxg49v8mrC0tA0M1%2FDynamicTemplateV_1.xslt?alt=media&token=780c2b51-5e5c-4fcf-b9a0-224a29377920)

[Open](https://3916435711-files.gitbook.io/~/files/v0/b/gitbook-legacy-files/o/assets%2F-LfO_rsQzfnV957oTV_f%2F-MB3R-1BxdiuYwLajU3w%2F-MB3Uxg49v8mrC0tA0M1%2FDynamicTemplateV_1.xslt?alt=media&token=780c2b51-5e5c-4fcf-b9a0-224a29377920)
