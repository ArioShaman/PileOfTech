class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
    @projects
  end

end
