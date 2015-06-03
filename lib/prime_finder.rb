class PrimeFinder
  FIRST_PRIME = 2

  class << self
    def find_first(count)
      primes = []
      current = FIRST_PRIME

      while primes.length < count
        primes << current if is_prime?(current)
        current += 1
      end

      primes
    end

    def is_prime?(number)
      return false if number < FIRST_PRIME
      return true if number == FIRST_PRIME

      (number - 1).downto(2).each do |operand|
        return false if number % operand == 0
      end

      true
    end
  end
end
