require 'optparse'
require 'multiplication_table'

class MultiplicationTableCli
  attr_reader :count

  def initialize(argv)
    options = {}

    OptionParser.new do |opts|
      opts.banner = 'Usage: ./bin/multiplication_table [options]'

      opts.on('-c COUNT', '--count COUNT', Integer, 'Number of primes for which a table will be built (default = 10). Only positive integers are valid.') do |count|
        raise OptionParser::InvalidArgument, 'You must pick a positive integer' if count <= 0
        options[:count] = count
      end
    end.parse!(argv)

    @count = options[:count] || 10
  end

  def execute!
    MultiplicationTable.new(count: count).run
  end
end
