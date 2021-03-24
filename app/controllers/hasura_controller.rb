class HasuraController < ApplicationController

	def register_user_handler
    user = User.new(input_params)

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

  def input_params # ":input" is the param provided by hasura, NOT ":user"
    params.require(:input).permit(:fb_id, :first_name, :last_name, :name, :picture_url)
  end

end
