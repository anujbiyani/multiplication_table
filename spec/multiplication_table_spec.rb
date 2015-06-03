require 'multiplication_table_helper'
require 'multiplication_table'
require 'stringio'

# only used in tests to assert against
require 'prime'

RSpec.describe MultiplicationTable do
  describe '#initialize' do
    it 'determines the list of prime numbers' do
      count = 5
      expect(PrimeFinder).to receive(:find_first).with(count).and_call_original

      MultiplicationTable.new(count: count)
    end

    it 'determines the column width' do
      width = MultiplicationTable.new(count: 5).send(:column_width)

      # 11 is the 5th prime number, so expected width is
      # the number of digits in (11 * 11) + 1
      expect(width).to eq 4
    end
  end

  describe '#run' do
    let(:multiplication_table) { MultiplicationTable.new(output: StringIO.new, count: 2) }

    it 'prints the multiplication table' do
      multiplication_table.run
      output_by_rows = multiplication_table.send(:output).string.split("\n")

      expect(output_by_rows.first).to match /\s|2\s3/
      expect(output_by_rows[2]).to match /\s2|\s4\s6/
      expect(output_by_rows.last).to match /\s3|\s6\s9/
    end
  end
end
