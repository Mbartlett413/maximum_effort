class Api::V1::StatisticsController < ApplicationController
    def ip_statistics
        #Get all users and track the IP iso
        #@user = User.all.pluck(:user_ip)
        #count
        #@user.tally


        #Considering there is only one user
        #and the IP address would be the same
        #I created a fake collection of data
        regions = ["US", "Africa", "Asia", "Europe", "Oceania"]
        fake_collection = []
        i = 0
        
        while i < 100 do 
            random_value = Random.new.rand(0..4)
            fake_collection.push(regions[random_value.to_i])
            i = i + 1
        end 

        ip_stats = fake_collection.tally
        render json: {status: 200, ip_statistics: ip_stats}
    end 
end
