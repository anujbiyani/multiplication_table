class PrimeFinder
  class << self
    def is_prime?(number)
      return false if number == 0
      return false if number == 1
      return true if number == 2

      (number - 1).downto(2).each do |operand|
        return false if number % operand == 0
      end

      true
    end
  end
end
