require "rubygems"
require "net/https"
require "json"
require "uri"

class OauthController < ApplicationController

  def new

    # verify that the access token belongs to us
    uri = URI.parse("https://api.amazon.com/auth/o2/tokeninfo?access_token=" + URI.encode(params[:access_token]))
    req = Net::HTTP::Get.new(uri.request_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    response = http.request(req)
    decode = JSON.parse(response.body)

    if decode['aud'] != 'amzn1.application-oa2-client.c4acf8675a5c4f73bccbede476545fa6'
      raise "Invalid token"
    end

    uri = URI.parse("https://api.amazon.com/user/profile")
    req = Net::HTTP::Get.new(uri.request_uri)
    req['Authorization'] = "bearer " + params[:access_token]
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER

    response = http.request(req)
    decode = JSON.parse(response.body)

    if  user = User.exists?(amazon_id: decode['user_id'])
      user = User.find_by(amazon_id: decode['user_id'])
      session[:user_id] = user.id
    else
      user = User.create(
        username: decode['name'],
        email: "amazon_email_#{decode['email']}",
        password: random_password,
        amazon_id: decode['user_id']
      )
      binding.pry
      session[:user_id] = user.id
    end
    redirect_to dashboard_path
    puts sprintf "%s %s %s", decode['name'], decode['email'], decode['user_id']
  end

  private

    def random_password
      SecureRandom.urlsafe_base64
    end
end
