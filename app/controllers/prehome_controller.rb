class PrehomeController < ApplicationController
  
  before_action :search

  def index
  	@projects = Project.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

  private

  def search
  	@q = Profile.ransack(params[:q])
    @people = @q.result(distinct: true).order("created_at DESC")
    render :partial => 'something/index'
  end

end
