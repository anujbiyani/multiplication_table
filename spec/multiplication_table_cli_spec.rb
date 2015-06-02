require 'multiplication_table_helper'
require 'multiplication_table_cli'

RSpec.describe MultiplicationTableCli do
  describe '#initialize' do
    it 'takes a count' do
      expect(MultiplicationTableCli.new(%w(--count 10)).count).to eq 10
      expect(MultiplicationTableCli.new(%w(-c 10)).count).to eq 10
    end
  end
end
