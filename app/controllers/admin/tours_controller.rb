class Admin::ToursController < ApplicationController
  layout 'admin'

  before_action :set_admin_tour, only: [:show, :edit, :update, :destroy]

  # GET /admin/tours
  # GET /admin/tours.json
  def index
    @admin_tours = Tour.all
  end

  # GET /admin/tours/1
  # GET /admin/tours/1.json
  def show
  end

  # GET /admin/tours/new
  def new
    @admin_tour = Tour.new
  end

  # GET /admin/tours/1/edit
  def edit
  end

  # POST /admin/tours
  # POST /admin/tours.json
  def create
    @admin_tour = Tour.new(admin_tour_params)

    respond_to do |format|
      if @admin_tour.save
        format.html { redirect_to @admin_tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @admin_tour }
      else
        format.html { render :new }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tours/1
  # PATCH/PUT /admin/tours/1.json
  def update
    respond_to do |format|
      if @admin_tour.update(admin_tour_params)
        format.html { redirect_to @admin_tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_tour }
      else
        format.html { render :edit }
        format.json { render json: @admin_tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tours/1
  # DELETE /admin/tours/1.json
  def destroy
    @admin_tour.destroy
    respond_to do |format|
      format.html { redirect_to admin_tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    Tour.destroy(params[:tour_ids]) unless params[:tour_ids].blank?
    respond_to do |format|
      format.html { redirect_to admin_tours_url, notice: "已删除." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_tour
      @admin_tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_tour_params
      params.require(:tour).permit(
        :title, :sub_title, :addr, :price, :work_range, 
        :hint, :desc, :traffic, :seq, :position, :city_id,
        :lon, :lat,
        tickets_attributes: [:id, :title, :style, :desc, :price, :_destroy],
        images_attributes: [:id, :photo, :_destroy],
        )
    end
end
