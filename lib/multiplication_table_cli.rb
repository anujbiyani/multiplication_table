require 'optparse'

class MultiplicationTableCli
  attr_reader :count

  def initialize(argv)
    options = {}

    OptionParser.new do |opts|
      opts.banner = 'Usage: ./bin/multiplication_table [options]'

      opts.on('-c COUNT', '--count COUNT', Integer, 'Number of primes for which a table will be built') do |count|
        options[:count] = count
      end
    end.parse!(argv)

    @count = options[:count]
  end
end
