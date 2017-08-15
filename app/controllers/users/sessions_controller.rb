class Users::SessionsController < Devise::SessionsController

  def new
    super do |resource|
      resource.build_user_profile
    end
  end

end
