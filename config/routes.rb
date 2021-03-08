Rails.application.routes.draw do
  
  post "/registerUser" => "hasura#register_user_handler"

end
