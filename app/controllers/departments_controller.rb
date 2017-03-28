class DepartmentsController < ApplicationController
  def show
    @department = Department.find(params[:id])
    if @department.dashboards.count == 0
      raise ActionController::RoutingError, 'Not Found'
    end
  end
end