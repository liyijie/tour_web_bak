class Admin::TicketsController < ApplicationController
  layout 'admin'

  before_action :set_admin_ticket, only: [:show, :edit, :update, :destroy]

  # GET /admin/tickets
  # GET /admin/tickets.json
  def index
    @admin_tickets = Ticket.all
  end

  # GET /admin/tickets/1
  # GET /admin/tickets/1.json
  def show
  end

  # GET /admin/tickets/new
  def new
    @tour = Tour.find(params[:tour_id])
    @admin_ticket = @tour.tickets.build
  end

  # GET /admin/tickets/1/edit
  def edit
  end

  # POST /admin/tickets
  # POST /admin/tickets.json
  def create
    @tour = Tour.find(params[:tour_id])
    @admin_ticket = @tour.tickets.create(admin_ticket_params)

    respond_to do |format|
      if @admin_ticket.save
        format.html { redirect_to [:admin, @tour], notice: 'Ticket was successfully created.' }
        format.json { render :show, status: :created, location: @admin_ticket }
      else
        format.html { render :new }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/tickets/1
  # PATCH/PUT /admin/tickets/1.json
  def update
    respond_to do |format|
      if @admin_ticket.update(admin_ticket_params)
        format.html { redirect_to @admin_ticket, notice: 'Ticket was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_ticket }
      else
        format.html { render :edit }
        format.json { render json: @admin_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/tickets/1
  # DELETE /admin/tickets/1.json
  def destroy
    @admin_ticket.destroy
    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: 'Ticket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_multiple
    Ticket.destroy(params[:ticket_ids]) unless params[:ticket_ids].blank?
    respond_to do |format|
      format.html { redirect_to admin_tickets_url, notice: "已删除." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_ticket
      @admin_ticket = Ticket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_ticket_params
      params[:ticket].permit(:style, :title, :desc, :price, :position)
    end
end
