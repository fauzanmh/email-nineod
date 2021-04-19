class HomeController < ApplicationController
    def index
        @u = User.first
        data = ['status' => 'oke', 'data' =>  @u]
        render json: data
        # render 'main'
    end
end
