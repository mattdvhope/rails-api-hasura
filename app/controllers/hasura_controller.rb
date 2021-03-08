class HasuraController < ApplicationController

	def register_user_handler
    request_data = params[:input]
    puts request_data
    render json: request_data
  end

end
