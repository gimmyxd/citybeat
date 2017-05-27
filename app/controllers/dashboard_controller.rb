class DashboardController < ApplicationController
  def index
    @projects = Project.paginate(
      page: params[:page],
      per_page: 10
    ).order('created_at DESC')
  end
end
