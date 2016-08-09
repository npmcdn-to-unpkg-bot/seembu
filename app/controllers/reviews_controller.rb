class ReviewsController < ApplicationController

	before_action :find_profile
	before_action :find_review, only: [:edit, :update, :destroy]

	 def new
	 	@review = Review.new

	 	if current_user 
    		@review = Review.where(user_id: current_user.id, profile_id: params[:profile_id]).first_or_initialize 
	    	if @review.id.present? 
	      		render 'edit' 
	    	end 
  	 	end 
	 end

	 def create
	 	@review = Review.new(review_params)
	 	@review.profile_id = @profile.id
	 	@review.user_id = current_user.id

	 	if @review.save
	 		redirect_to profile_path(@profile.id)
	 	else
	 		render 'new'
	 	end
	 end

	 def edit
	 end

	 def update
	 	if @review.update(review_params)
	 		redirect_to profile_path(@profile.id)
	 	else
	 		render 'edit'
	 	end
	 end

	 def destroy
	 	@review.destroy
	 	redirect_to profile_path(@profile.id)
	 end

	 private

	 def review_params
	 	params.require(:review).permit(:rating, :content, :relation)
	 end

	 def find_profile
	 	@profile = Profile.find(params[:profile_id])
	 end

	 def find_review
	 	@review = Review.find(params[:id])
	 end

end
