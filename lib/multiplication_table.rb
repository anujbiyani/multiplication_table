require 'prime_finder'

class MultiplicationTable
  COLUMN_WIDTH = 5

  attr_reader :count, :output

  def initialize(count: 10, output: STDOUT)
    @count = count
    @output = output
  end

  def run
    prime_numbers = PrimeFinder.find_first(count)

    output.print '|'.rjust(COLUMN_WIDTH)
    output.print prime_numbers.map { |s| s.to_s.rjust(COLUMN_WIDTH) }.join('')
    print_newline

    output.print '+'.rjust(COLUMN_WIDTH, '-')
    output.print '-'.rjust(count * COLUMN_WIDTH, '-')
    print_newline

    prime_numbers.each do |row_number|
      output.print row_number.to_s.rjust(COLUMN_WIDTH - 1)
      output.print '|'

      prime_numbers.each do |column_number|
        output.print (row_number * column_number).to_s.rjust(COLUMN_WIDTH)
      end

      print_newline
    end

    print_newline
  end

  private

  def print_newline
    output.print "\n"
  end
end
