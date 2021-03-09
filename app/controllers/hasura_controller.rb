class HasuraController < ApplicationController

	def register_user_handler
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

  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
