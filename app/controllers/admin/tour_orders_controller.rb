class Admin::TourOrdersController < ApplicationController
  before_action :set_admin_tour_order, only: [:show, :edit, :update, :destroy]

  # GET /admin/tour_orders
  # GET /admin/tour_orders.json
  def index
    @admin_tour_orders = Admin::TourOrder.all
  end

  # GET /admin/tour_orders/1
  # GET /admin/tour_orders/1.json
  def show
  end

  # GET /admin/tour_orders/new
  def new
    @admin_tour_order = Admin::TourOrder.new
  end

  # GET /admin/tour_orders/1/edit
  def edit
  end

  # POST /admin/tour_orders
  # POST /admin/tour_orders.json
  def create
    @admin_tour_order = Admin::TourOrder.new(admin_tour_order_params)

    respond_to do |format|
      if @admin_tour_order.save
        format.html { redirect_to @admin_tour_order, notice: 'Tour order was successfully created.' }
        format.json { render :show, status: :created, location: @admin_tour_order }
      else
        format.html { render :new }
        format.json { render json: @admin_tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tour_orders/1
  # PATCH/PUT /admin/tour_orders/1.json
  def update
    respond_to do |format|
      if @admin_tour_order.update(admin_tour_order_params)
        format.html { redirect_to @admin_tour_order, notice: 'Tour order was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_tour_order }
      else
        format.html { render :edit }
        format.json { render json: @admin_tour_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tour_orders/1
  # DELETE /admin/tour_orders/1.json
  def destroy
    @admin_tour_order.destroy
    respond_to do |format|
      format.html { redirect_to admin_tour_orders_url, notice: 'Tour order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tour_order
      @admin_tour_order = Admin::TourOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_tour_order_params
      params[:admin_tour_order]
    end
end
