class PrehomeController < ApplicationController

  def index
  	@projects = Project.all
  end

end
