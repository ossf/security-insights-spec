# `repository`

The `repository` object specifies repository-related configurations, including policies, team members, documentation, license, security, and supply chain information.

---

## `repository.bug-fixes-only`
- **Type**: `bool`
- **Description**: *[Add description here]*

---

## `repository.accepts-change-request`
- **Type**: `bool`
- **Description**: *[Add description here]*

---

## `repository.accepts-automated-change-request`
- **Type**: `bool`
- **Description**: *[Add description here]*

---

## `repository.automated-tools` (optional)
A list of objects describing automated tools.

### `automated-tools[].automated-tool`
- **Type**: `string`
- **Description**: *[Add description here]*

### `automated-tools[].action`
- **Type**: `string`
- **Description**: *[Add description here]*

### `automated-tools[].path`
- **Type**: `string list`
- **Description**: *[Add description here]*

### `automated-tools[].comment` (optional)
- **Type**: `string`
- **Description**: *[Add description here]*

---

## `repository.core-team`
A list of objects representing core team members.

### `core-team[].name`
- **Type**: `string`
- **Description**: *[Add description here]*

### `core-team[].affiliation`
- **Type**: `string`
- **Description**: *[Add description here]*

### `core-team[].contact` (optional)
- **Type**: `string`
- **Description**: *[Add description here]*

---

## `repository.documentation` (optional)
An object referencing documentation URLs.  
Each field, if present, must match `^https?://[^\\s]+$`:

- **`documentation.contributing-guide`** (optional)
- **`documentation.review-policy`** (optional)
- **`documentation.security-policy`** (optional)

For each key:
- **Type**: `string`  
- **Description**: *[Add description here]*  

---

## `repository.license`
An object specifying the repository license details.

### `license.url`
- **Type**: `string`
- **Matches Pattern**: `^https?://[^\\s]+$`
- **Description**: *[Add description here]*

### `license.expresion`
- **Type**: `string`
- **Description**: *[Add description here]*

---

## `repository.security` (optional)
An object describing repository security-related artifacts, champions, and testing.

### `security.artifacts`
#### `artifacts.self-assessment`
- **`self-assessment.evidence`** (optional)
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: *[Add description here]*

- **`self-assessment.comment`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

#### `artifacts.third-party-assessments`
A list of objects describing third-party assessments.

- **`third-party-assessments[].name`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`third-party-assessments[].evidence`** (optional)
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: *[Add description here]*

- **`third-party-assessments[].date`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`third-party-assessments[].comment`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

---

### `repository.security.champions` (optional)
A list of objects describing security champions.

- **`champions[].name`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`champions[].contact`** (optional)
  - **Type**: `string`
  - **Description**: *[Add description here]*

---

### `repository.security.testing`
A list of objects describing the testing tools and approaches.

- **`testing[].tool-type`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`testing[].tool-name`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`testing[].tool-version`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`testing[].tool-url`**
  - **Type**: `string`
  - **Matches Pattern**: `^https?://[^\\s]+$`
  - **Description**: *[Add description here]*

- **`testing[].tool-rulesets`**
  - **Type**: `string list`
  - **Description**: *[Add description here]*

- **`testing[].integration`**
  - **`integration.ad-hoc`**: `bool`  
  - **`integration.ci`**: `bool`  
  - **`integration.before-release`**: `bool`
  - **Description**: *[Add description here]*

- **`testing[].comment`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

---

## `repository.supply-chain` (optional)
An object describing the supply chain management for the repository.

### `supply-chain.third-party-packages`
- **Type**: `bool`
- **Description**: *[Add description here]*

### `supply-chain.lists`
- **Type**: `string list`
- **Description**: *[Add description here]*

### `supply-chain.management-policy`
An object describing management policy details.

- **`management-policy.url`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

- **`management-policy.comment`**
  - **Type**: `string`
  - **Description**: *[Add description here]*

---

> **Note**: Each field should be assigned a value consistent with its specified data type and/or regular expression pattern. Fields not marked as optional are required.
