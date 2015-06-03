require 'multiplication_table_helper'
require 'multiplication_table'
require 'stringio'

# only used in tests to assert against
require 'prime'

RSpec.describe MultiplicationTable do
  describe '#initialize' do
    it 'takes a count' do
      expect(MultiplicationTable.new(count: 5).count).to eq 5
    end

    it 'defaults to 10' do
      expect(MultiplicationTable.new.count).to eq 10
    end
  end

  describe '#run' do
    let(:multiplication_table) { MultiplicationTable.new(output: StringIO.new, count: 2) }

    it 'prints the multiplication table' do
      multiplication_table.run

      output_by_rows = multiplication_table.output.string.split("\n")
      expect(output_by_rows.first).to match /\s|2\s3/
      expect(output_by_rows[2]).to match /\s2|\s4\s6/
      expect(output_by_rows.last).to match /\s3|\s6\s9/
    end
  end
end
