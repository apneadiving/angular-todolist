class HomeController < ApplicationController

  def index
  end

  def catch_all
    render :index
  end


end
