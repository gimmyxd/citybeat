class DashboardController < ApplicationController
  def index
    p = params.deep_dup
    p[:q] ||= {}

    @search = Project.ransack(p[:q])
    projects = @search.result.search_projects(search_params)
    @projects = projects.paginate(
      page: params[:page],
      per_page: 10
    ).order(created_at: :desc)

    @top_projects = Project.joins(:articles)
      .group('projects.id')
      .order('count(articles.project_id) desc').last(5)
  end

  private

  def search_params
    params.permit(:search)
  end

  def filter_params
    params[:q]
  end
end
