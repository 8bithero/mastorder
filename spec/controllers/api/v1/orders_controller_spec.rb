require "rails_helper"

RSpec.describe Api::V1::OrdersController, type: :controller do
  let(:valid_session) { {} }
  let!(:order) { FactoryGirl.create :order }

  describe "GET #index" do
    it "assigns all orders as @orders" do
      get :index, params: {}, session: valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

  describe "GET #show" do
    it "assigns the requested order as @order" do
      get :show, params: {id: order.to_param}, session: valid_session
      expect(assigns(:order)).to eq(order)
    end
  end
end
