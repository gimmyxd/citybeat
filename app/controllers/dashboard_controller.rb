class DashboardController < ApplicationController
  def index

    projects = Project.ransack(filter_params).search_projects(search_params)
    @projects = projects.paginate(
      page: params[:page],
      per_page: 10
    ).order('created_at DESC')
  end

  private

  def search_params
    params.permit(:search)
  end

  def filter_params
    params[:q]
  end
end
