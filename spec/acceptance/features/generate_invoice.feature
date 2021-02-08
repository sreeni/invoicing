Feature: Generating an Invoice
    Background:
        Given an inventory of products:
            | Product     | Size | Price  |
            | Watermelons | 3    | $6.99  |
            | Watermelons | 5    | $8.99  |
            | Pineapples  | 2    | $9.95  |
            | Pineapples  | 5    | $16.95 |
            | Pineapples  | 8    | $24.95 |
            | Rockmelons  | 3    | $5.95  |
            | Rockmelons  | 5    | $9.95  |
            | Rockmelons  | 9    | $16.99 |

    Scenario: Customer places a simple order that matches the pack size
        Given a customer order:
            | Product     | Quantity |
            | Watermelons | 3        |
            | Pineapples  | 2        |
            | Rockmelons  | 3        |

        When an invoice is generated
        Then the invoice amount should be "$22.89"