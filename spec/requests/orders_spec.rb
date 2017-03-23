require "rails_helper"

RSpec.describe "Orders", type: :request do
  let(:parameters) { { format: :json } }
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  describe "index" do
    context "when no resources exist" do
      it "returns an OK HTTP status code" do
        my_get v1_orders_path, params: parameters, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it "returns an empty JSON array" do
        my_get v1_orders_path, params: parameters, headers: headers

        expect(json).to be_an Array
        expect(json).to be_empty
      end
    end

    context "when some resources exist" do
      before do
        FactoryGirl.create_list :order, 3
      end

      it "returns an OK HTTP status code" do
        my_get v1_orders_path, params: parameters, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it "returns an array of resources" do
        my_get v1_orders_path, params: parameters, headers: headers
        expect(json).to be_an Array
        expect(json.size).to eq 3
      end
    end
  end

  describe "show" do
    context "when no resources exist" do
      it "raises a RecordNotFound exception" do
        expect {
          my_get v1_order_path(id: 1), params: parameters, headers: headers
        }.to raise_exception(ActiveRecord::RecordNotFound)
      end

      it "returns an empty JSON array" do
        my_get v1_orders_path, params: parameters, headers: headers

        expect(json).to be_an Array
        expect(json).to be_empty
      end
    end

    context "when some resources exist" do
      let(:order) { Order.first }

      before do
        FactoryGirl.create_list :order, 3
      end

      it "returns an OK HTTP status code" do
        my_get v1_order_path(id: order.id), params: parameters, headers: headers
        expect(response).to have_http_status(:ok)
      end

      it "returns an array of resources" do
        my_get v1_orders_path, params: parameters, headers: headers
        expect(json).to be_an Array
        expect(json.size).to eq 3
      end
    end
  end
end
