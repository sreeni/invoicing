# Invoicing System Coding Challenge

Solution Description

The example input for this problem is contained in the acceptance tests based on [Turnip](https://github.com/jnicklas/turnip)

Feature files are present in `spec/acceptance/features`

### Dependencies

- Ruby 2.6.3 or above
- bundler

## Running Tests

`bundle exec rake`

### To run tests interactively

`bundle exec guard`

### Domain Model

- `InvoicingSystem` - Serves as the entry point to the app and collaborates with other actors to calculate the invoice
- `Iventory` - Aggregate that holds the product data
- `Product` - represents a single product or pack
- `Order` - aggregate that has a collection of order items
- `ProductPicker` - responsible for selecting products that will fulfill the order.
- `PickedItem` - represents the group of products that will match a order item
- `Invoice` - represents the final generated invoice against an order.

`Money` gem is used to represent the amount in local currency.

TODO:

- Add Documentation
- Handle error scenarios
- Display sub total and price against each order item
