require 'rails_helper'

RSpec.describe OrderSerializer do
  let(:order) { FactoryGirl.create(:order) }
  let(:order_product) { order.order_products.first }
  let(:product) { order_product.product }
  let(:serializer) { OrderSerializer.new(order) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  subject { JSON.parse(serialization.to_json) }

  it "includes the expected attributes" do
    expect(subject.keys).
      to contain_exactly(
        "date", "total_amount", "products"
      )
  end

  it "includes the related products" do
    expect(subject["products"].first.keys).
      to contain_exactly(
        "uuid", "name", "description", "price", "quantity"
      )
  end

  describe "order attributes" do
    it "should have a date that matches" do
      expect(subject["date"]).to eql(Date.today.strftime("%F"))
    end

    it "should have a total_amount that matches" do
      expect(subject["total_amount"]).to eql("GBP 20.00")
    end
  end

  describe "product attributes" do
    subject { JSON.parse(serialization.to_json)["products"].first }

    it "should have a uuid that matches" do
      expect(subject["uuid"]).to eql(product.uuid)
    end

    it "should have a name that matches" do
      expect(subject["name"]).to eql(product.name)
    end

    it "should have a description that matches" do
      expect(subject["description"]).to eql(product.description)
    end

    it "should have a price that matches" do
      expect(subject["price"]).to eql("GBP 10.00")
    end

    it "should have a quantity that matches" do
      expect(subject["quantity"]).to eql(2)
    end
  end
end
