class HasuraController < ApplicationController

	def register_user_handler
    # request_data = params[:input]
    user = User.new(user_params)
    if user.save
	    render json: user
	  else
      begin
        user.save!
      rescue ActiveRecord::RecordInvalid => e
        render json: {:code=>422, :message=>e}
      else
        render json: nil, status: :ok
      end
	  end

		# request_data = params[:input]
  #   puts request_data
  #   render json: request_data

  end

  private

  def user_params
    params[:input].require(:user).permit(:name, :email, :password)
  end

end
