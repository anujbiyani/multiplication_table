require 'multiplication_table_helper'

RSpec::Matchers.define :be_prime do
  match do |actual|
    PrimeFinder.is_prime?(actual) == Prime.prime?(actual)
  end

  match_when_negated do |actual|
    PrimeFinder.is_prime?(actual) == Prime.prime?(actual)
  end

  failure_message do |actual|
    "expected that #{actual} would be a prime number"
  end

  failure_message_when_negated do |actual|
    "expected that #{actual} would not be a prime number"
  end
end
