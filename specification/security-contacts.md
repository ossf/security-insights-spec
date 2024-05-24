# Security Contacts

The "`security-contacts`" section is a list of contacts (email, phone, URLs) of the responsible persons or team for the security of the project. This section is **required**.

```yaml
security-contacts:
- type: email
  value: joe.bob@email.com
  primary: true
- type: email
  value: alice.bob@email.com
  primary: false
```

This section is an array of objects.

- `primary`
  - **Description:** Define if the provided contact is a primary contact or not. 
  - **Type:** Boolean.
- `type` (Required)
  - **Description:** Provide the type of contact: email, phone, or website.
  - **Type:** String. The contact type must match one of the values defined in the field `enum` of the schema.
- `value` (Required)
  - **Description:** Provide a valid security contact.
  - **Type:** String. The value must be an e-mail contact, a URI, or a mobile phone.
