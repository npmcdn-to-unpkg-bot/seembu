class PrehomeController < ApplicationController

  def index
  	@projects = Project.all.paginate(:page => params[:page], :per_page => 9)
  end

end
