class DashboardsController < ApplicationController
  before_action :set_dashboard, only: [:show, :edit, :update, :destroy]

  def index
    @dashboards = Dashboard.all
  end

  def new
    @dashboard = Dashboard.new
  end

  def edit
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)

    if @dashboard.save
      redirect_to :dashboards, notice: 'Dashboard was successfully created.'
    else
      render :new
    end
  end

  def update
    if @dashboard.update(dashboard_params)
      redirect_to dashboards_url, notice: 'Dashboard was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @dashboard.destroy
    redirect_to dashboards_url, notice: 'Dashboard was successfully destroyed.'
  end

  private
    def set_dashboard
      @dashboard = Dashboard.find(params[:id])
    end

    def dashboard_params
      params.require(:dashboard).permit(:name, :url, :department_id)
    end
end
