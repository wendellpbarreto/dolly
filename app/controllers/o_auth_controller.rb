class OAuthController < ApplicationController
  def callback
    if params[:code]
      access_token = Koala::Facebook::OAuth.new(oauth_callback_url).get_access_token(params[:code])
      if access_token
        api = Koala::Facebook::API.new(access_token, ENV['FB_SECRET_KEY'].to_s)
        profile = api.get_object("me")
        auth = User.find_or_create_by(fb_id: profile["id"])do |user|
          user.fb_token = access_token
          user.name = profile["name"]
          user.role = Role.find_by(name: 'Admin')
        end
        auth.fb_token = access_token
        auth.save
        sign_in(auth)
        redirect_to rails_admin_path
      else
        redirect_to new_user_session_path
      end
    else
      redirect_to new_user_session_path
    end
  end
end
