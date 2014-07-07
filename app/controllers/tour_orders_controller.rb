class TourOrdersController < ApplicationController
  before_action :set_tour_order, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /tour_orders
  # GET /tour_orders.json
  def index
    @tour_orders = TourOrder.all
  end

  # GET /tour_orders/1
  # GET /tour_orders/1.json
  def show
  end

  # GET /tour_orders/new
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @tour_order = @ticket.tour_orders.build
    @tour_order.build_order_info
  end

  # GET /tour_orders/1/edit
  def edit
  end

  # POST /tour_orders
  # POST /tour_orders.json
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @tour_order = @ticket.tour_orders.build(tour_order_params)
    @tour_order.user_id = current_user.id

    respond_to do |format|
      if @tour_order.save
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully created.' }
        format.json { render :show, status: :created, location: @tour_order }
      else
        format.html { render :new }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tour_orders/1
  # PATCH/PUT /tour_orders/1.json
  def update
    respond_to do |format|
      if @tour_order.update(tour_order_params)
        format.html { redirect_to @tour_order, notice: 'Tour order was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour_order }
      else
        format.html { render :edit }
        format.json { render json: @tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tour_orders/1
  # DELETE /tour_orders/1.json
  def destroy
    @tour_order.destroy
    respond_to do |format|
      format.html { redirect_to tour_orders_url, notice: 'Tour order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour_order
      @tour_order = TourOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_order_params
      params.require(:tour_order).permit(
        :total_price, :number,
        order_info_attributes: [:id, :name, :tel, :email]
        )
    end
end