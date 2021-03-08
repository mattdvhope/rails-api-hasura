class HasuraController < ApplicationController

	def register_user_handler
    request_data = params[:input]
    puts request_data
    render json: {id: 1} #request_data
  end

end
