class User < ApplicationRecord
  require "uri"
  require 'net/http'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #, :trackable

  def self.track_ip(data)
          user = User.find_by_email(data)
          check = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
          response_body = {}
          
          if !check.empty?
            ip_address = 'http://ifconfig.co/json?ip=' + check
            url = URI(ip_address)
            http = Net::HTTP.new(url.host, url.port);
            request = Net::HTTP::Get.new(url)

            response = http.request(request)
            response_body =  JSON.parse(response.body)
          end 

          # if value doesn't exist, will store as nil
          if response_body != {}
            user.update_attributes(:user_ip => response_body['country_iso'])
          end 
  end 
end
