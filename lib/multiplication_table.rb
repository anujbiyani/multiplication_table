require 'prime_finder'

class MultiplicationTable
  def initialize(count: 10, output: STDOUT)
    @prime_numbers = PrimeFinder.find_first(count)
    @output = output
    @column_width = (prime_numbers.last * prime_numbers.last).to_s.length + 1
  end

  def run
    print_header_row
    print_divider_row

    prime_numbers.each do |number_for_row|
      output.print number_for_row.to_s.rjust(column_width - 1)
      output.print '|'

      prime_numbers.each do |column_number|
        output.print (number_for_row * column_number).to_s.rjust(column_width)
      end

      print_newline
    end

    print_newline
  end

  private

  attr_reader :prime_numbers, :column_width, :output

  def print_divider_row
    output.print '+'.rjust(column_width, '-')
    output.print '-'.rjust(prime_numbers.length * column_width, '-')
    print_newline
  end

  def print_header_row
    output.print '|'.rjust(column_width)
    output.print prime_numbers.map { |s| s.to_s.rjust(column_width) }.join('')
    print_newline
  end

  def print_newline
    output.print "\n"
  end
end
