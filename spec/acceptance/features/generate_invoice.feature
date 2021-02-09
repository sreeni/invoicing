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
        And the invoice should contain the following itemization:
            | Product     | Pack Size | Units | Unit Price | Total Price |
            | Watermelons | 3         | 1     | $6.99      | $6.99       |
            | Pineapples  | 2         | 1     | $9.95      | $9.95       |
            | Rockmelons  | 3         | 1     | $5.95      | $5.95       |

    Scenario: Customer places order that needs optimization based on pack size
        Given a customer order:
            | Product     | Quantity |
            | Watermelons | 10       |
            | Pineapples  | 14       |
            | Rockmelons  | 13       |

        When an invoice is generated
        Then the invoice amount should be "$98.63"
        And the invoice should contain the following itemization:
            | Product     | Pack Size | Units | Unit Price | Total Price |
            | Watermelons | 5         | 2     | $8.99      | $17.98      |
            | Pineapples  | 8         | 1     | $24.95     | $24.95      |
            | Pineapples  | 2         | 3     | $9.95      | $29.85      |
            | Rockmelons  | 5         | 2     | $9.95      | $19.90      |
            | Rockmelons  | 3         | 1     | $5.95      | $5.95       |