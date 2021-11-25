# ER Diagram

```mermaid
erDiagram

    CSO ||--o{ GRANT : receives
    GRANT }o--|| FUNDER : paid
    GRANT ||--o{ PARTNERSHIP : has
```