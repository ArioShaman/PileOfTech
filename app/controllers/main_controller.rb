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
    @projects = Project.where(kind: 'design')
    @projects
  end

  def sites
    @projects = Project.where(kind: 'website')
    @projects
  end

  def contacts
    render :contacts
  end
end
