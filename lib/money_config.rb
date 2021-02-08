require 'money'

Money.default_currency = Money::Currency.new('AUD')
Money.rounding_mode = BigDecimal::ROUND_HALF_UP
Money.locale_backend = :currency
