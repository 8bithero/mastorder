module Api::V1
  class OrdersController < ApiController
    before_action :set_order, only: [:show]

    # GET v1/orders
    def index
      @orders = Order.all.includes(:products)
      render json: @orders
    end

    # GET v1/orders/1
    def show
      render json: @order
    end

    private
      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.fetch(:order, {})
      end
  end
end
