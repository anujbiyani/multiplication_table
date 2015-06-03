require 'multiplication_table_helper'
require 'multiplication_table_cli'

RSpec.describe MultiplicationTableCli do
  describe '#initialize' do
    it 'takes a count' do
      expect(MultiplicationTableCli.new(%w(--count 10)).count).to eq 10
      expect(MultiplicationTableCli.new(%w(-c 10)).count).to eq 10
    end
  end

  describe '#execute!' do
    it 'passes the count to the multiplication table generator' do
      multiplication_table = instance_double MultiplicationTable, run: nil
      expect(MultiplicationTable).to receive(:new).with(count: 10).and_return(multiplication_table)

      MultiplicationTableCli.new(%w(--count 10)).execute!
    end
  end
end
