---
title: "Integration plugin optional Formulas"
description: "Can be used in the Mapping tab (Expression column) or in HTTP tab as expression (with $#<Expression>#$ Syntax)"
order: 253
---
# Integration plugin optional Formulas

*Can be used in the Mapping tab (Expression column) or in HTTP tab as expression (with $#<Expression>#$ Syntax)*

|  |  |  |  |  |
| --- | --- | --- | --- | --- |
| Operator | Type | Optional Values | Description | Example |
| \= | boolean | Two numeric / date / string values | True if the left value does equals the right value. | Price = 20.00<br><br>Date = #1/31/82#<br><br>Dept = “Men |
| IN | boolean | A column name and a comma-separated set of constant values | True if the column value can be found in the set of constants. | Country IN (‘U.S.A.’, ‘U.K.’, ‘Australia’) |
| LIKE | boolean | String value and pattern value | The left operand is a string value and the right operand is a string-matching pattern with \* as the wildcard character. The result is true if the string value matches the pattern. | ItemName LIKE '%product%’<br><br>e.g. this will be true for the value ‘myproduct1’ |
| + | string / numeric | Two numeric / string values | Adds two numeric values or concatenates two string values. | Price + 10.00<br><br>‘Mr. ’ + LastName |
| \- | numeric | Two numeric values | Subtracts the right value from the left value. | Price - Discount |
| \* | numeric | Two numeric values | Multiplies the two values | Price \* 1.2 |
| / | numeric | Two numeric values | Divides the left value by the right value | Price / 2 |
| Convert<br><br>(exp, type) | According to typeoperand | An expression and the conversion type | Converts an expression to the given type.<br><br>Valid types are:<br><br>· System.String<br><br>· System.Int32<br><br>· System.Int64<br><br>· System.Decimal<br><br>· System.DateTime | Convert(Total, 'System.Int32') |
| LEN(exp) | numeric | A string value | The result is the number of characters in the string value | Len(ItemName) |
| ISNULL<br><br>(exp, val) | According to valoperand | An expression and a replacement value | If the expression’s value is null, returns the replacement value; otherwise returns the original expression value. | IsNull(price, -1) |
| IIF(exp,<br><br>trueval,<br><br>falseval) | According to value operands | A boolean expression and two numeric / string values. | If the expression is true, returns the second operand’s value; otherwise returns the third operand’s value. | IIF(Price>100.00, 'expensive', 'affordable') |
| TRIM(exp) | string | A string value | Removes leading and trailing blank characters from the string value. | TRIM(Comment) |
| SUBSTRING(exp,<br><br>start, len) | string | A string value and two numeric values. | Returns a substring of the exp operand, starting from the character located at start, with a length of len. | SUBSTRING(CategName, 5, 10) |
| Sum (fldName) | numeric | A field name | Returns the sum of all the field values | Sum(Sales) |
| Avg (fldName) | numeric | A field name | Returns the average of all the field values | Avg(Price) |
| Min (fldName) | numeric | A field name | Returns the minimal value of all the field values | Min(Price) |
| Max (fldName) | numeric | A field name | Returns the maximal value of all the field values | Max(Price) |
