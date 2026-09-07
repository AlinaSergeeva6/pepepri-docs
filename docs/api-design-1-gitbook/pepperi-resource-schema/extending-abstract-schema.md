---
description: extending an abstract schema to become operative
---

# Extending 'abstract' Schema

'abstract' type schema cannot be used to create documents, its purpose is to define a base schema with fields and behavior that can be mutual to several schema thus enabling to query few schemas together&#x20;

for example if survey and visit inherit activity we can query the mutual fields of both visit and survey (e.g. 'status' FieldID in this case)

All common behavior is managed on a joined data index managed by the base class

* Extending a schema can only be done from abstract schema and only one abstract schema
* abstract schema can also extend to another abstract schema
* validation on the "concrete" schema will be done based on schema, in the future we will expose a "validation" endpoint to provide ability to make better validation
* the type of the schema which extends an abstract schema is defined by the abstract it is extending

#### abstract as generic resource&#x20;

* the abstract schema and all the extended schemas must be generic resource = true, in other words, hierarchy can only be created for generic resources (operative documents)
* generic resource endpoints should be implemented by the addon implementing/exposing the abstract schema&#x20;
* upsert on abstract endpoint should be blocked (400)

&#x20;
