class HasuraController < ApplicationController

	def register_user_handler
    user = User.new(user_params)

    if user.save
	    render json: {id: user.id, username: user.username, email: user.email}
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

  def user_params # ":input" is the param provided by hasura
    params.require(:input).permit(:username, :email, :password)
  end

end
