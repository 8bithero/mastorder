require "rails_helper"

RSpec.describe Api::V1::OrdersController, type: :routing do
  describe "routing" do

    before do
      Rails.application.routes.default_url_options[:host] = "test.host"
    end

    it "routes to #index" do
      expect(:get => v1_orders_url).to route_to("api/v1/orders#index", subdomain: "api")
    end

    it "routes to #show" do
      expect(:get => v1_order_url(id: "1")).to route_to("api/v1/orders#show", :id => "1", subdomain: "api")
    end
  end
end
