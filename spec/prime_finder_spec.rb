require 'multiplication_table_helper'
require 'prime_finder'

# only used in tests to assert against
require 'prime'

RSpec.describe PrimeFinder do
  describe '.find_first' do
    it 'finds the first N prime numbers' do
      expect(PrimeFinder.find_first(5)).to match_array Prime.first 5
      expect(PrimeFinder.find_first(10)).to match_array Prime.first 10
    end
  end

  describe '.is_prime?' do
    it 'is true for prime numbers'do
      Prime.first(10).each do |known_prime|
        expect(PrimeFinder.is_prime?(known_prime)).to eq true
      end
    end

    it 'is false for non-prime numbers'do
      expect(PrimeFinder.is_prime?(6)).to eq false
    end

    it 'is false for the number 1' do
      expect(PrimeFinder.is_prime?(1)).to eq false
    end

    it 'is false for the number 0' do
      expect(0).not_to be_prime
    end

    it 'matches what the Prime class returns' do
      random_numbers = 500.times.map { rand(500) }.uniq

      random_numbers.each do |number_to_check|
        expect(number_to_check).to be_prime
      end
    end
  end
end
