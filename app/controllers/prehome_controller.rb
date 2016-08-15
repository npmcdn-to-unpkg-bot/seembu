class PrehomeController < ApplicationController

  def index
  	@projects = Project.order("created_at DESC").paginate(:page => params[:page], :per_page => 6)
  end

end
