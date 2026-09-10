---
title: "Additional info about ODBC"
description: "This example you can find in 'Integration Examples' (6685) SAP(ODBC) dataflow task."
order: 145
---
# Additional info about ODBC

*This example you can find in 'Integration Examples' (6685) SAP(ODBC) dataflow task.*

An **ODBC** driver uses the Open Database Connectivity (**ODBC**) interface by Microsoft that allows applications to access data in database management systems (**DBMS**) using **SQL** as a standard for accessing the data. **ODBC** permits maximum interoperability, which means a single application can access different **DBMS**.

#### The ODBC driver interface defines:

-   A library of ODBC function calls of two types:
    -   Core functions that are based on the X/Open and SQL Access Group
    -   Call Level Interface specification
    -   Extended functions that support additional functionality, including scrollable cursors

-   SQL syntax based on the X/Open and SQL Access Group SQL CAE specification (1992)
-   A standard set of error codes
-   A standard way to connect and logon to a DBMS
-   A standard representation for data types

ODBC applications perform almost all of their database access by executing Transact-SQL statements. The form of these statements depends on the application requirements. SQL statements can be constructed in the following ways:

-   Hard-coded

Static statements performed by an application as a fixed task.

-   Constructed at run time

SQL statements constructed at run time that enable the user to tailor the statement by using common clauses, such as SELECT, WHERE, and ORDER BY. This includes ad hoc queries entered by users.

The SQL Server Client ODBC driver parses SQL statements only for ODBC and ISO syntax not directly supported by the Database Engine, which the driver transforms into Transact-SQL. All other SQL syntax is passed to the Database Engine unchanged, where SQL Server will determine if it is valid SQL Server. This approach yields two benefits:

-   Reduced overhead

Processing overhead for the driver is minimized because it only has to scan for a small set of ODBC and ISO clauses.

-   Flexibility

Programmers can tailor the portability of their applications. To enhance portability against multiple databases, use primarily ODBC and ISO syntax. To use enhancements specific to SQL Server, use the appropriate Transact-SQL syntax. The SQL Server Native Client ODBC driver supports the complete Transact-SQL syntax so ODBC-based applications can take advantage of all the features in SQL Server.

The column list in a SELECT statement should contain only the columns required to perform the current task. Not only does this reduce the amount of data sent across the network, but also it reduces the effect of database changes on the application. If an application does not reference a column from a table, then the application is not affected by any changes made to that column.

## ODBC SQL Syntax Notes

### Reserved ODBC SQL Words

While using the IDLdbDatabase::ExecuteSQL method in Dataminer, do not use the following reserved words in the SQL command string: DOUBLE, FLOAT, and TEMP. These words are reserved in ODBC SQL and result in syntax errors if you attempt to use them in your SQL code.

### Date, Time, and Timestamp Data

Because there are a wide variety of date and time formats in use by different databases, ODBC uses a special clause in the SQL statement to identify dates and times. The syntax is:

|  |  |
| --- | --- |
| Syntax | Format |
| {d 'value'} | yyyy-mm-dd |
| {t 'value'} | hh:mm:ss |
| {ts 'value'} | yyyy-mm-dd hh:mm:ss |

For example, to use a date-and-time timestamp, the SQL statement might look something like:

```
select time from events where time > { ts '1997-01-16 08:50:43' }
```

### Scalar Functions

Scalar functions-string length, absolute value, or date, for example-require a special clause. To call a scalar function when selecting a result set, use syntax like:

```
{fn scalar-function}
```

where scalar-function is the name of the scalar function you are calling. For example, calling the UCASE function on a field might look something like this:

```
SELECT { fn UCASE(NAME) } FROM employee
```

### Converting Data

ODBC provides a scalar function that requests that the data source convert data from one SQL data type to another. The syntax is:

```
{ fn CONVERT(value_expression, data_type) }
```

where value\_expression is the name of a column from a table, a literal value, or the result of another scalar function, and data\_type is one of ODBC's defined data types.

### LIKE Predicate Escape Characters

When using an SQL LIKE predicate, the percent character (%) and the underscore character (\_) have special meanings. You can include these characters as literals in a LIKE predicate by using an escape clause, which has the following syntax:

```
{ escape 'escape-character' }
```

where escape-character is a character used in front of the special character to force evaluation with its literal value.

For example, since the percent character matches zero or more of any character when used in a LIKE predicate, the string '%AAA%' would match any number any character, followed by three "A"s, followed by any number of any character. Using an escape clause in the LIKE predicate allows you to use the literal "%" in the string. For example:

```
select name where name like '\%AAA%' { escape '\' }
```

selects names that include the percent character, followed by three "A"s, followed by any number of any character. The backslash ( \\ ) is used to "escape" the percent character.

### Outer Joins

ODBC supports the ANSI SQL-92 left outer join syntax. The syntax is:

```
{ oj outer-join }
```

where outer-join is:

```
table-reference LEFT OUTER JOIN
  { table-reference | outer-join } ON search-condition
```

Consult your ODBC documentation for further details on outer joins.

### Procedure Calls

An application can call a procedure in place of an SQL statement. The syntax for a procedure call is:

```
{ [?=] call procedure-name[([parameter],[parameter],...)] }
```

where procedure-name specifies the name of a procedure (stored on the data source) and parameters are parameters of the procedure.

## Integration configurations

Integration configuration is the same as for Native SQL, the only thing you should not to forget is to change client type:

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/1-39.png)

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/2-28.png)

## SAP HANA First Time Plugin Installation

#### Before the installation please be sure that you have Remote Access to the customer server. Instructions how to get it you can read here.

Second requirement - if customer uses only 32bit version of ODBC Driver, 64bit should also be installed. To check it, search 'ODBC' on server

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-465.png)

And find line with column in the red box in ODBC Data Sources (32-bit), 'System DSN' tab

![](https://alinasergeeva6.github.io/pepepri-docs/pepepri-internal%20articles/static/image-466.png)

This is correct name of the ODBC driver you need to use later. Then follow all the steps that are described in the "**First Time Plugin Installation"** article. Link below: [https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/quickbooks-desktop-integration/first-time-plugin-installation](https://kbint.pepperi.com/integration-platform-ipaas/integration-with-different-erp-systems/quickbooks-desktop-integration/first-time-plugin-installation)
