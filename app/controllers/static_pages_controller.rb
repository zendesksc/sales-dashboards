class StaticPagesController < ApplicationController

  def index
    @departments = Department.all
  end

  def deal  
  end

end