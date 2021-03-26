class HasuraController < ApplicationController

  def register_user_handler
    user = User.find_by_fb_id(input_params[:fb_id]) # maybe change to 'where' for better performance speed
    if user
      update_login_time(user, input_params[:login_time])
      render json: user
    else
      create
    end
  end

	def create
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
      params.require(:input).permit(:fb_id, :first_name, :last_name, :name, :picture_url, :login_time)
    end

    def update_login_time(user, login_time)
      user.login_time = login_time
      user.save
    end

end
