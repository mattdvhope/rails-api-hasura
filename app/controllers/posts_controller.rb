class PostsController < ApplicationController

	def create
		post = Post.new(input_parameters)

		if post.save
			render json: post
		else
      begin
        post.save!
      rescue ActiveRecord::RecordInvalid => e
        render json: {:code=>422, :message=>e}
      else
        render json: nil, status: :ok
      end
		end

	end

  def input_params # ":input" is the param provided by hasura, NOT ":post"
    params.require(:input).permit(:content)
  end

end
