class MainController < ApplicationController
  def index
  end

  def about
    render :about
  end

  def gallery
    render :gallery
  end

  def contacts
    render :contacts
  end
end
