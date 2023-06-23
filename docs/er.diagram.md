# ER Diagrams

```mermaid
erDiagram
  CSO ||--o{ GRANT : receives
  CSO ||--|{ ACCOUNT : has
  CSO ||--|{ EXPENSE_CATEGORY : has

  GRANT }o--|| FINANCIER : paid
  GRANT ||..o{ PARTNERSHIP : "can have"
  GRANT ||--|{ PAYMENT : has
  GRANT ||--o{ DOCUMENT : has
  GRANT ||--o{ REPORT_SCHEDULE : has
  GRANT ||--|{ BUDGET_LINE : has
  GRANT ||--o{ NOTE : "can have"



  BUDGET_LINE |o--o{ BUDGET_CATEGORY : has
  BUDGET_LINE ||..|{ BUDGET_PARTNER_DETAILS : "can have"

  BALANCE_SHEET_ITEM }o--|| BALANCE_SHEET_ITEM_CATEGORY : "belongs to"
  BALANCE_SHEET_ITEM }o--o{ PAYMENT : "can have"
  BALANCE_SHEET_ITEM }o--o{ GRANT : "can have"
  BALANCE_SHEET_ITEM ||--|| ACCOUNT : "has"

  BALANCE_SHEET_ITEM }o--o{ EXPENSE : "associated with"

  EXPENSE }o--o{ BUDGET_LINE : "can be allocated to"
  EXPENSE }o--o{ GRANT : "can be allocated to"
  EXPENSE ||--|| EXPENSE_CATEGORY : "is"

  PARTNERSHIP }|--o{ PARTNER : has
  BUDGET_PARTNER_DETAILS }|--|| PARTNER : has

```

```mermaid
erDiagram

  ACCOUNT {
        string  BankName
        string  IBAN
        string  Alias
        string  ShortIBAN
        bool    IsCash
  }

  SPONSOR {
    string    Name
    string    Description
    string    Alias
    string    LegalRepresentative
    string    ContactPerson
    string    ContactEmail
    string    ContactPhone
    string    ContactAddress
  }

  GRANT {
    enum      FundType
    number    Value
    number    ValueLocal
    number    SelfCoFundValue
    number    ReGrantedValue
    number    ReGrantedValueLocal
    string    Currency
    string    CurrencyLocal
    enum      Type
    string    Financier
    string    Owner
    string    OwnerEmail
    string    OwnerPhone
    string    OwnerAddress
    date      StartDate
    date      EndDate
    string    ProjectName
  }

  PARTNERSHIP {
    string    Partner
    number    Value
    string    Details
  }

  REPORT_SCHEDULE {
    date      Date
    enum      Type
  }

  DOCUMENT {
    string    FileName
    date      Date
    binary    Contents
  }

  NOTE {
    date      Date
    string    Content
  }

  CSO {
    string    Name
  }

  BALANCE_SHEET_ITEM {
    %% income, expense
    enum    Kind
    %% grant, q-point from product file
    enum    TypeOfIncome
    %% FK When type of income is grant
    string  GrantId
    %% FK optional payment association
    string  PaymentId
  }

  PAYMENT {
    number    Value
    string    Currency
    number    ValueLocal
  }

  EXPENSE {
    enum      Type
    %% EXPENSE_CATEGORY ID
    enum      Category
    %% FK
    string    BUDGET_LINE
    %% FK
    string    GRANT
    number    Value
    string    Currency
    number    ValueLocal
  }
```

## CO-fund example

---

FUll sum = 100k
Self co-fund value = 10k
Partner#1 co-fund value= 5k
Partner#2 co-fund value= 15k

---

Grant properties:

- Value:100k
- RegrantedValue: `Value` - `self-co-found-value` - SUM(`Partnerships.Values`)
  =(100 - 10 - (5+15)) = 70k (calculated field)
- self-co-found-value: 10k
- Partnerships:

  - partner: Partner#1
    Value: 5k
  - partner: Partner#2
    Value: 15k

- Budget:

  - `category`: Development

    - `description`: UX/UI Design
    - `value`: 3600
    - `re-granted-value`: (value - co-fund-self-value - SUM(Partner. - co-fund-value + Partner.Value)) (calculated field)
    - `co-funded`: true
    - `co-fund-self-value`: 200
    - partners:
      - partner: Partner#1
        `co-fund-value`: 0
        `Value`: 200
      - partner: Partner#2
        co-fund-value: 0
        Value: 0

  - category: administrative
    value: 40k
    co-funded: true
    co-fund-self-value: ?
    co-fund-partners: - partner: Partner#1
    Value: ? - partner: Partner#2
    Value: ?

  - 10k

> Validation rules:
>
> - grant.self-co-fund-value = SUM(BUDGET.co-fund-self-value)
> - grant.Partnerships.partner#X.Value = SUM(BUDGET.co-fund-partners.partner#x.Value)
> - grant.value = SUM(BUDGET.value)
