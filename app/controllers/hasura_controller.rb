class HasuraController < ApplicationController

	def register_user_handler
    # request_data = params[:input]
    user = User.new(user_params)
    if user.save
	    render json: user # {id: 1} #request_data
	  else
      begin
        user.save!
      rescue ActiveRecord::RecordInvalid => e
        render json: {:code=>422, :message=>e}
      else
        render json: nil, status: :ok
      end
	  end
  end

  private

  def user_params
    params[:input].require(:user).permit(:username, :email, :password)
  end

end
