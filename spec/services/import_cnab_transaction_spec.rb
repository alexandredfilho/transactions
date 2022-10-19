require 'rails_helper'

RSpec.describe ImportCnabTransaction do

  let(:transactions_quantity) {CnabTransaction.count}

  describe "#execute" do
    it "Should import data" do
      path = Rails.root.join('spec', 'fixtures', 'CNAB.txt')

      def service(path)
        described_class.new(path)
      end

      def lines(path)
        File.readlines(path).size
      end

      import = service(path)

      import.execute
      expect(import.errors.count).to be_zero
      expect(lines(path)).to eq(transactions_quantity)
    end
  end
end
