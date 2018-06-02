class MainController < ApplicationController
  def index
  end

  def about
    render :about
  end

  def gallery
    render :gallery
  end

  def design
    render :design
  end

  def sites
    render :sites
  end

  def contacts
    render :contacts
  end
end
