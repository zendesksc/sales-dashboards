class StaticPagesController < ApplicationController

  def index
    @departments = Department.all
  end
  
end