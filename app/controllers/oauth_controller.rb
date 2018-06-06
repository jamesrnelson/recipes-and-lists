require "rubygems"
require "net/https"
require "json"
require "uri"

class OauthController < ApplicationController
  def create
    if user = User.from_omniauth(request.env["omniauth.auth"])

      session[:user_id] = user.id
      session[:token] = request.env["omniauth.auth"]['credentials']['token']
    end
    redirect_to recipes_path
  end
end
