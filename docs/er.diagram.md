# ER Diagram

```mermaid
erDiagram
    CSO ||--o{ GRANT : "can receive"
    GRANT }o--|| FUNDER : "is paid by"

    GRANT ||--o{ PARTNERSHIP : "can have"
```