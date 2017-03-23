require "rails_helper"

RSpec.describe Order, type: :model do
  it { is_expected.to have_many(:order_products) }
  it { is_expected.to have_many(:products).through(:order_products) }

  describe "#date" do
    subject { FactoryGirl.create(:order) }

    it "returns the correct date" do
      expect(subject.date).to eql Date.today.strftime("%F")
    end
  end

  describe "#total_amount" do
    # NOTE: Order's products factory has price = 10.00 GBP
    # => Order's order_products factory has quantity = 2
    subject { FactoryGirl.create(:order) }

    it "returns the correct total_amount" do
      expect(subject.total_amount).to eql Money.new(2000, "GBP")
    end
  end

  describe "#build_order_products_from_basket" do
    before do
      subject.build_order_products_from_basket(basket_products)
    end

    let(:basket_products) do
      [{
          product_id: 1,
          quantity: 1,
          at_sale_price: Money.new(100)
        }]
    end

    it "should not save the new records" do
      expect(subject.order_products.first).to be_a_new OrderProduct
    end
  end
end
