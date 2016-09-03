class ContactsController < ApplicationController
	
  def new
  	@contact = Contact.new

  	@profile = Profile.find(params[:profile_id])
  end

  def create
  	@contact = Contact.new(contact_params)
  	
  	@profile = Profile.find(params[:profile_id])

    if @contact.valid?
      @contact.email = @profile.user.email

      if user_signed_in?
        @contact.sender_email = current_user.email
      end

      UserMailer.contact_email(@contact).deliver_now

      redirect_to profile_path( @profile ), notice: "Your messages has been sent."
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

  private

  # def find_profile
  # 	@profile = Profile.find(params[:id])
  # end

  def contact_params
    params.require(:contact).permit(:name, :email, :reason, :content, :number)
  end

end
