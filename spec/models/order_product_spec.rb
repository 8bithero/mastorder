require "rails_helper"

RSpec.describe OrderProduct, type: :model do
  let!(:order) { FactoryGirl.create(:order) }

  it { is_expected.to respond_to(:quantity) }
  it { is_expected.to monetize(:at_sale_price) }
  it { is_expected.to belong_to(:order) }
  it { is_expected.to belong_to(:product) }

  subject { order.order_products.first }

  describe "#at_sale_price_total" do
    it "returns the correct at_sale_price" do
      expect(subject.at_sale_price_total).to eql Money.new(2000, "GBP")
    end
  end
end
